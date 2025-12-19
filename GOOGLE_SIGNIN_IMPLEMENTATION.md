# Google Sign-In Implementation Report
## ApparenceKit Flutter Template Pattern

### Overview

This implementation uses the `google_sign_in` package v7.x with a REST API backend exchange pattern (not Firebase Auth). The flow obtains a Google ID token on the client, exchanges it with the backend for a Sanctum token, and stores credentials securely.

---

## Google Cloud Console Setup

### Step 1: Create a Project

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Click on the project selector (top left)
3. **New Project** → Enter name → **Create**

### Step 2: Configure OAuth Consent Screen

1. Sidebar menu → **APIs & Services** → **OAuth consent screen**
2. Select **External** (for users outside your organization)
3. Fill in required fields:
   - **App name**: Your app name
   - **User support email**: Your email
   - **Developer contact email**: Your email
4. **Save and Continue** (you can skip scopes and test users for now)
5. **Publish App** when ready for production

### Step 3: Create OAuth 2.0 Credentials

Go to **APIs & Services** → **Credentials** → **Create Credentials** → **OAuth client ID**

#### A) Web Application (REQUIRED)
```
Type: Web application
Name: "Web Client" (or any name)

→ Copy the CLIENT ID (e.g., 123456789-abc123.apps.googleusercontent.com)
```
**This is the `GOOGLE_SERVER_CLIENT_ID` used by your Flutter app.**

#### B) Android (if your app targets Android)
```
Type: Android
Name: "Android Client"
Package name: com.yourcompany.yourapp (from AndroidManifest.xml)
SHA-1 certificate fingerprint: (see below how to obtain it)
```

#### C) iOS (if your app targets iOS)
```
Type: iOS
Name: "iOS Client"
Bundle ID: com.yourcompany.yourapp (from Info.plist)
```

### Step 4: Obtain SHA-1 for Android

```bash
# Debug (local development)
cd android
./gradlew signingReport

# Look for the SHA1 line under "Variant: debug"
```

For release, use your production keystore:
```bash
keytool -list -v -keystore your-release-key.keystore -alias your-alias
```

### Step 5: Configure Your Flutter App

```bash
# Use the Web Client ID (NOT Android/iOS)
flutter run --dart-define=GOOGLE_SERVER_CLIENT_ID=123456789-abc123.apps.googleusercontent.com
```

### Understanding the Different Client IDs

| Credential | Purpose |
|------------|---------|
| **Web Client ID** | Passed to `GoogleSignIn.initialize(serverClientId: ...)` in Flutter |
| **Android Client ID** | Only needs to be created; SDK auto-detects via SHA-1 |
| **iOS Client ID** | Configured in `Info.plist` as URL scheme |

### Google Console Setup Checklist

- [ ] Project created in Google Cloud Console
- [ ] OAuth consent screen configured
- [ ] Web Application credential created → copy Client ID
- [ ] Android credential created with correct SHA-1
- [ ] iOS credential created with correct Bundle ID
- [ ] `GOOGLE_SERVER_CLIENT_ID` configured in Flutter with the **Web Client ID**

### Common Errors and Solutions

| Error | Solution |
|-------|----------|
| `DEVELOPER_ERROR` | Incorrect SHA-1 or package name mismatch |
| `sign_in_failed` | Missing or incorrect Web Client ID |
| `ApiException: 10` | Android credentials not configured |
| `ApiException: 12501` | User cancelled the sign-in flow |
| `Token validation failed` | Backend not validating ID token correctly |
| `PlatformException(sign_in_failed, com.google.android.gms.common.api.ApiException: 10)` | SHA-1 fingerprint not registered for this package name |

### Production vs Development

**Development:**
- Use debug SHA-1 from `./gradlew signingReport`
- OAuth consent screen can be in "Testing" mode
- Add test users manually if in testing mode

**Production:**
- Use release SHA-1 from your signing keystore
- Publish the OAuth consent screen
- May require Google verification for sensitive scopes

---

## Architecture Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                    AUTHENTICATION FLOW                       │
└─────────────────────────────────────────────────────────────┘

  UI Layer                    State Layer                Data Layer
┌──────────────┐          ┌──────────────────┐       ┌──────────────┐
│ GoogleSignIn │─────────▶│ SigninState      │──────▶│ AuthApi      │
│ Component    │          │ Notifier         │       │              │
└──────────────┘          └──────────────────┘       └──────────────┘
                                   │                        │
                                   ▼                        ▼
                          ┌──────────────────┐       ┌──────────────┐
                          │ UserState        │       │ GoogleSignIn │
                          │ Notifier         │       │ SDK          │
                          └──────────────────┘       └──────────────┘
                                   │                        │
                                   ▼                        ▼
                          ┌──────────────────┐       ┌──────────────┐
                          │ SecuredStorage   │       │ Backend API  │
                          └──────────────────┘       │ /auth/social │
                                                     └──────────────┘
```

---

## Dependencies (pubspec.yaml)

```yaml
dependencies:
  google_sign_in: ^7.2.0          # Google Sign-In SDK
  flutter_secure_storage: ^9.2.4  # Secure token storage
  dio: ^5.9.0                     # HTTP client
  flutter_riverpod: ^3.0.3        # State management
  riverpod_annotation: ^3.0.3     # Code generation
  freezed_annotation: ^3.1.0      # Immutable models
```

---

## File Structure

```
lib/
├── core/
│   ├── data/
│   │   ├── api/
│   │   │   └── http_client.dart          # Bearer token injection
│   │   └── entities/
│   │       └── user_entity.dart          # Credentials model
│   ├── security/
│   │   └── secured_storage.dart          # Token storage
│   └── states/
│       └── user_state_notifier.dart      # Global user state
│
└── modules/
    └── authentication/
        ├── api/
        │   ├── authentication_api.dart           # Google SDK + API call
        │   └── authentication_api_interface.dart # Interface contract
        ├── providers/
        │   ├── signin_state_provider.dart        # Riverpod notifier
        │   └── models/
        │       └── signin_state.dart             # Freezed state
        ├── repositories/
        │   └── authentication_repository.dart    # Business logic
        └── ui/
            ├── signin_page.dart                  # Main page
            ├── components/
            │   └── google_signin.dart            # Sign-in component
            └── widgets/
                └── round_signin.dart             # Button widget
```

---

## Implementation Details

### 1. API Layer (`authentication_api.dart`)

```dart
class HttpAuthenticationApi implements AuthenticationApi {
  final HttpClient _client;

  HttpAuthenticationApi(this._client);

  @override
  Future<Credentials> signinWithGoogle() async {
    try {
      // Initialize Google Sign-In with Web Client ID
      final serverClientId = const String.fromEnvironment('GOOGLE_SERVER_CLIENT_ID');

      await GoogleSignIn.instance.initialize(
        serverClientId: serverClientId,
      );

      // v7.x API: use authenticate() instead of signIn()
      final auth = await GoogleSignIn.instance.authenticate();
      final idToken = auth.idToken;

      if (idToken == null) {
        throw ApiError(message: 'Failed to get Google ID token');
      }

      // Exchange ID token with backend
      final response = await _client.post(
        '/auth/social/google',
        data: {'id_token': idToken},
      );

      return Credentials.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiError.fromDioException(e);
    }
  }
}
```

**Key Points:**
- Uses `GoogleSignIn.instance` singleton pattern (v7.x)
- Requires `GOOGLE_SERVER_CLIENT_ID` environment variable (Web Client ID from Google Console)
- Sends ID token to backend, receives app-specific credentials

### 2. Repository Layer (`authentication_repository.dart`)

```dart
class HttpAuthenticationRepository implements AuthenticationRepository {
  final AuthenticationApi _authenticationApi;
  final AuthSecuredStorage _storage;
  final HttpClient _httpClient;

  HttpAuthenticationRepository(
    this._authenticationApi,
    this._storage,
    this._httpClient,
  );

  @override
  Future<void> signinWithGoogle() async {
    try {
      final credentials = await _authenticationApi.signinWithGoogle();
      await _storage.write(value: credentials);
      _httpClient.authToken = credentials.token;
    } on ApiError catch (e) {
      throw SigninException(message: e.message);
    }
  }
}
```

**Responsibilities:**
- Call API layer
- Store credentials in secure storage
- Set HTTP client auth token

### 3. State Provider (`signin_state_provider.dart`)

```dart
@Riverpod(keepAlive: false)
class SigninStateNotifier extends _$SigninStateNotifier {
  late final AuthenticationRepository _authRepository;
  late final UserStateNotifier _userStateNotifier;

  @override
  SigninState build() {
    _authRepository = ref.watch(authRepositoryProvider);
    _userStateNotifier = ref.watch(userStateNotifierProvider.notifier);
    return const SigninState.data();
  }

  Future<void> signinWithGoogle() async {
    if (state.isSending) return;

    state = const SigninState.sending();

    try {
      await _authRepository.signinWithGoogle();
      await Future.delayed(const Duration(milliseconds: 1500));
      await _userStateNotifier.onSignin();
    } catch (e) {
      debugPrint('Google sign-in error: $e');
      state = const SigninState.data();
      rethrow;
    }
  }
}
```

### 4. UI Component (`google_signin.dart`)

```dart
class GoogleSignInComponent extends ConsumerWidget {
  const GoogleSignInComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SocialSigninButton.google(
      onPressed: () async {
        try {
          await ref.read(signinStateProvider.notifier).signinWithGoogle();
          if (context.mounted) {
            context.pushReplacement('/');
          }
        } catch (e) {
          if (context.mounted) {
            showErrorToast(context, 'Cannot signin with Google');
          }
        }
      },
    );
  }
}
```

### 5. Button Widget (`round_signin.dart`)

```dart
class SocialSigninButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconAsset;

  const SocialSigninButton._({
    required this.onPressed,
    required this.iconAsset,
  });

  factory SocialSigninButton.google({required VoidCallback onPressed}) {
    return SocialSigninButton._(
      onPressed: onPressed,
      iconAsset: 'assets/icons/google.png',
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Center(
          child: Image.asset(iconAsset, width: 24, height: 24),
        ),
      ),
    );
  }
}
```

### 6. Secure Storage (`secured_storage.dart`)

```dart
class AuthSecuredStorage {
  final FlutterSecureStorage _storage;

  AuthSecuredStorage(this._storage);

  Future<void> write({required Credentials value}) async {
    await _storage.write(key: 'userId', value: value.id);
    await _storage.write(key: 'token', value: value.token);
  }

  Future<Credentials?> read() async {
    final id = await _storage.read(key: 'userId');
    final token = await _storage.read(key: 'token');
    if (id == null || token == null) return null;
    return Credentials(id: id, token: token);
  }

  Future<void> clear() async {
    await _storage.delete(key: 'userId');
    await _storage.delete(key: 'token');
  }
}
```

### 7. HTTP Client with Auto-Injection (`http_client.dart`)

```dart
class HttpClient extends DioMixin {
  String? authToken;

  HttpClient({required String baseUrl}) {
    options = BaseOptions(baseUrl: baseUrl);
    httpClientAdapter = IOHttpClientAdapter();

    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (authToken != null) {
            options.headers.putIfAbsent(
              'Authorization',
              () => 'Bearer $authToken',
            );
          }
          return handler.next(options);
        },
      ),
    );
  }
}
```

### 8. Credentials Model (`user_entity.dart`)

```dart
class Credentials {
  final String id;
  final String token;

  Credentials({required this.id, required this.token});

  factory Credentials.fromJson(Map<String, dynamic> json) {
    return Credentials(
      id: json['id'] as String,
      token: json['token'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'token': token,
  };
}
```

---

## Backend API Contract

```
POST /auth/social/google
Content-Type: application/json

Request:
{
  "id_token": "eyJhbGciOiJSUzI1NiIsImtpZCI6..."
}

Response (200 OK):
{
  "id": "user-uuid-string",
  "token": "1|abc123defghijklmnop..."
}

Response (401 Unauthorized):
{
  "message": "Invalid ID token"
}
```

---

## Provider Dependency Graph

```dart
// Provider definitions (generated with @riverpod)

@riverpod
HttpClient httpClient(Ref ref) => HttpClient(baseUrl: Environnements.backendUrl);

@riverpod
AuthenticationApi authenticationApi(Ref ref) =>
    HttpAuthenticationApi(ref.watch(httpClientProvider));

@riverpod
AuthSecuredStorage authSecuredStorage(Ref ref) =>
    AuthSecuredStorage(const FlutterSecureStorage());

@riverpod
AuthenticationRepository authRepository(Ref ref) => HttpAuthenticationRepository(
    ref.watch(authenticationApiProvider),
    ref.watch(authSecuredStorageProvider),
    ref.watch(httpClientProvider),
);

@Riverpod(keepAlive: true)
class UserStateNotifier extends _$UserStateNotifier { ... }

@Riverpod(keepAlive: false)
class SigninStateNotifier extends _$SigninStateNotifier { ... }
```

---

## Configuration Checklist

### 1. Google Cloud Console Setup
- [ ] Create OAuth 2.0 credentials (Web Application type)
- [ ] Configure OAuth consent screen
- [ ] Note the **Web Client ID** (not Android/iOS app ID)

### 2. Environment Variable
```bash
flutter run --dart-define=GOOGLE_SERVER_CLIENT_ID=your-web-client-id.apps.googleusercontent.com
```

### 3. Android Configuration
- [ ] Add `INTERNET` permission in `AndroidManifest.xml` (usually already present)
```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

### 4. iOS Configuration
- [ ] Add URL schemes in `Info.plist` if required by your OAuth setup
```xml
<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>com.googleusercontent.apps.YOUR_CLIENT_ID</string>
    </array>
  </dict>
</array>
```

### 5. Assets
- [ ] Add `assets/icons/google.png` for the button icon

### 6. Backend Endpoint
- [ ] Implement `POST /auth/social/google` that:
  - Validates ID token with Google's API
  - Creates or finds user by email
  - Returns `{ id, token }` credentials

---

## Key Implementation Notes

| Aspect | Details |
|--------|---------|
| **Package Version** | `google_sign_in: ^7.2.0` uses `.authenticate()` not `.signIn()` |
| **Client ID Type** | Must use **Web** client ID, not Android/iOS app ID |
| **Token Flow** | Google ID Token → Backend → App Token (Sanctum) |
| **Storage** | `FlutterSecureStorage` for encrypted credential storage |
| **HTTP Auth** | Bearer token auto-injected via Dio interceptor |
| **State Pattern** | Three layers: API → Repository → Notifier → UI |
| **No Firebase Auth** | Uses REST API pattern for more control |

---

## Complete Flow Summary

1. **User taps Google button** → `GoogleSignInComponent`
2. **Component calls notifier** → `signinStateProvider.notifier.signinWithGoogle()`
3. **Notifier calls repository** → `authRepository.signinWithGoogle()`
4. **Repository calls API** → `authenticationApi.signinWithGoogle()`
5. **API initializes Google SDK** → `GoogleSignIn.instance.initialize(serverClientId: ...)`
6. **SDK shows Google dialog** → `GoogleSignIn.instance.authenticate()`
7. **User authenticates with Google** → Returns ID token
8. **API exchanges token with backend** → `POST /auth/social/google`
9. **Backend validates & returns credentials** → `{ id, token }`
10. **Repository stores credentials** → `securedStorage.write(credentials)`
11. **Repository sets HTTP token** → `httpClient.authToken = token`
12. **Notifier loads user state** → `userStateNotifier.onSignin()`
13. **UI navigates to home** → `context.pushReplacement('/')`

---

This pattern provides clean separation of concerns, testability (via interface-based dependency injection), and secure token handling. The three-layer architecture ensures each component has a single responsibility and can be replaced independently.
