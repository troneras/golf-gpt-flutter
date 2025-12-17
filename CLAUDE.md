# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Quick Reference: Common Commands

```bash
# Code generation (freezed, riverpod, json_serializable)
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run build_runner watch  # Regenerate on file changes

# Development
flutter run --dart-define=BACKEND_URL=http://localhost:8888
flutter run --release

# Testing
flutter test                           # Run all tests
flutter test test/modules/authentication/signin_page_test.dart  # Single test
flutter test --coverage               # Generate coverage report

# Linting & Analysis
flutter analyze
dart format lib test                   # Format code

# Code generation for specific modules
flutter pub run build_runner build --delete-conflicting-outputs lib/modules/authentication
```

## Architecture Overview

This is a **Golf GPT mobile application** built with Flutter using the **ApparenceKit design system**. It follows a three-layer clean architecture pattern with explicit black box boundaries between modules.

### Core Architecture Pattern

```
HTTP Response (Entity)
    ↓
Repository (API → Domain Model)
    ↓
Riverpod Notifier/Provider (State Management)
    ↓
ConsumerWidget (UI)
```

Each layer has distinct responsibilities and is independently replaceable.

## Directory Structure & Module Boundaries

```
lib/
├── core/                          # Shared infrastructure (black box boundaries)
│   ├── data/
│   │   ├── api/                   # HTTP client setup
│   │   ├── entities/              # Raw API response models (auto-generated)
│   │   ├── models/                # Domain models (User, Subscription, etc.)
│   │   └── repositories/          # Data abstraction layer
│   ├── states/                    # Global state (User auth state, etc.)
│   ├── guards/                    # Route protection
│   ├── initializer/               # App startup sequencing
│   ├── theme/                     # Theme system + extensions
│   ├── widgets/                   # Shared UI components
│   ├── security/                  # Token storage & encryption
│   └── other modules...           # Ads, rating, bottom_menu, etc.
│
├── modules/                       # Feature modules (independent, replaceable)
│   ├── authentication/            # Email, phone, social login flows
│   ├── onboarding/                # User onboarding with questionnaire
│   ├── notifications/             # Push notifications
│   ├── settings/                  # User preferences
│   └── home/                      # Main app navigation
│
├── router.dart                    # GoRouter configuration & navigation
└── main.dart                      # App entry point
```

### Module Structure Pattern

Each feature module follows this consistent structure:

```
module_name/
├── api/                           # HTTP client(s)
│   └── entities/                  # Raw API response models
├── models/                        # Domain models
├── repositories/                  # Repository layer (API → Model)
├── providers/                     # Riverpod notifiers & simple providers
│   └── models/                    # State shape models (freezed)
└── ui/
    ├── pages/                     # Full-screen views
    ├── components/                # Feature-specific UI blocks
    └── widgets/                   # Reusable UI elements
```

**Key principle**: Modules expose **only Riverpod providers** in their public API. Internal implementation (API clients, repositories) is private.

## State Management: Riverpod 3.x

Uses `@riverpod` annotations with code generation. All state is managed through either:

1. **Notifiers** for complex, mutable state:
   ```dart
   @Riverpod(keepAlive: true)
   class UserStateNotifier extends _$UserStateNotifier {
     @override
     UserState build() => UserState.loading();

     Future<void> loadUser() async { ... }
   }
   ```

2. **Simple providers** for async operations:
   ```dart
   @riverpod
   Future<List<String>> fetchItems(Ref ref) async {
     final repo = ref.watch(itemRepositoryProvider);
     return repo.list();
   }
   ```

**Extensions**: Custom `ProviderX` extensions in each module (e.g., `ref.authNotifier` for ergonomic access).

## Immutability & Type Safety

- **Freezed** (`@freezed`) for immutable data classes with union types
- **json_serializable** for automatic JSON encoding/decoding
- Sealed classes for exhaustive pattern matching:
  ```dart
  sealed class User {
    factory User.authenticated({...}) = AuthenticatedUserData;
    factory User.anonymous({...}) = AnonymousUserData;
    factory User.loading() = LoadingUserData;
  }
  ```

## Authentication: Anonymous-First

Users start with **UUID + Sanctum token** (no login required):

1. First launch → Generate UUID & token
2. Full app access with anonymous user
3. Optional: Upgrade to authenticated user via email/social login
4. Data persists through upgrade

**Implementation**:
- `AuthenticationApi` handles credential storage
- `UserRepository` provides type-safe User domain model
- `UserStateNotifier` (core/states) = single source of truth for current user
- `UserInfoGuard` redirects to `/onboarding` if needed

## App Initialization Pipeline

The app initializes services in order via the `Initializer` widget:

```dart
[
  sharedPreferencesProvider,        // Load persistent storage
  notificationsSettingsProvider,    // Initialize notifications
  notificationRepositoryProvider,   // Setup push notifications
  userStateNotifierProvider.notifier, // Load user session
  analyticsApiProvider,             // Initialize analytics
]
```

Order matters: some services depend on others. Each must implement `OnStartService`.

## Testing Approach

Uses **fakes, not mocks** for all dependencies:

- **Fakes**: Minimal implementations of API interfaces (in `test/` directory)
- **Test widget extension**: `pumpPage()` helper configures the entire app with fakes and Riverpod overrides
- **Override pattern**: Pass fake implementations to `pumpPage()` to customize test conditions

Example:
```dart
testWidgets('signup succeeds', (tester) async {
  await tester.pumpPage(
    home: const SignupPage(),
    authApiFakeOverride: FakeAuthenticationApi()..setSuccess(),
  );

  await tester.enterText(find.byType(TextField), 'test@example.com');
  await tester.tap(find.byType(ElevatedButton));
  await tester.pumpAndSettle();

  expect(find.text('Success'), findsOneWidget);
});
```

**Key utilities**:
- `test/test_utils.dart`: `pumpPage()` extension with comprehensive fake setup
- `test/firebase_test_utils.dart`: Firebase mock initialization
- Module-specific fakes in `test/modules/*/data/`

## Code Generation Workflow

The project uses three code generators:

### 1. Freezed (Immutable Classes)
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class User with _$User {
  const factory User.authenticated({required String email}) = AuthenticatedUser;
  const factory User.anonymous() = AnonymousUser;

  const User._();

  String get idOrThrow => mapOrNull(
    authenticated: (u) => u.id,
  ) ?? throw Exception('No user ID');
}
```

### 2. JSON Serializable (JSON Parsing)
```dart
@JsonSerializable()
class UserEntity {
  final String id;
  final String email;

  UserEntity({required this.id, required this.email});

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
```

### 3. Riverpod Generator (State Management)
```dart
part 'user_repository_provider.g.dart';

@riverpod
UserRepository userRepository(Ref ref) {
  final api = ref.watch(userApiProvider);
  return UserRepository(api: api);
}
```

**Run code generation**:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

The `build.yaml` configures json_serializable to:
- Allow unknown JSON keys (lenient parsing)
- Always generate `toJson()` methods
- Use explicit JSON encoding

## Naming Conventions (from .cursor/rules/flutter.mdc)

- **Classes**: PascalCase (e.g., `UserRepository`, `SigninPage`)
- **Variables/Methods**: camelCase (e.g., `getUserById()`, `isLoading`)
- **Files/Directories**: snake_case (e.g., `user_repository.dart`)
- **Constants**: camelCase (e.g., `defaultTimeout`)
- **Boolean variables/methods**: Verb prefix (e.g., `isLoading`, `hasError`, `canDelete`)
- **Method names**: Start with verb (e.g., `getUserById()`, `saveUser()`)
- **Package imports**: Always use package imports, never relative
  ```dart
  import 'package:apparence_kit/core/data/models/user.dart';  // ✓
  import '../../../data/models/user.dart';                     // ✗
  ```

## Theme System (ApparenceKit)

Theme is managed via `ThemeProvider` (InheritedWidget + Riverpod):

```dart
// Access colors in build context
context.colors.primary
context.colors.background
context.colors.onBackground

// Access text theme
context.textTheme.titleLarge
context.textTheme.bodyMedium
```

**Theme files**:
- `core/theme/colors.dart`: Color definitions
- `core/theme/texts.dart`: Text theme setup
- `core/theme/providers/theme_provider.dart`: Theme notifier (light/dark mode toggle)

## Environment Configuration

The app supports multiple environments (Dev/Prod) via `Environment` sealed class:

```dart
sealed class Environment {
  factory Environment.fromEnv() {
    // Reads from build flags
    return DevEnvironment() or ProdEnvironment();
  }

  String get name; // "dev" or "prod"
  String get backendUrl;
  String get sentryDsn;
}
```

Run with environment:
```bash
flutter run --dart-define=BACKEND_URL=http://localhost:8888 --dart-define=ENV=dev
```

## Analytics & Error Reporting

- **Analytics API**: Tracks user actions (events, screens)
- **Sentry**: Error reporting in production (disabled in dev)
  - 20% sample rate (adjust as users grow)
  - Automatic breadcrumb tracking via GoRouter observer
- **Logger**: `logger` package for debug logging

## Localization (Slang)

Translations generated from JSON files in `lib/i18n/`:

```dart
import 'package:apparence_kit/i18n/translations.g.dart';

final text = t.login.title;  // Type-safe translations
```

Configuration in `slang.yaml`:
- Base locale: English
- Input: `lib/i18n/*.i18n.json`
- Output: `lib/i18n/translations.g.dart` (single file)

Wrap app with `TranslationProvider` to enable locale switching.

## Backend Integration

API calls flow through repositories to the backend:

```dart
// In modules/authentication/api/authentication_api.dart
class AuthenticationApi {
  Future<Credentials> signup(String email, String password) async {
    final response = await _dio.post('/api/auth/signup', data: {...});
    return Credentials.fromJson(response.data);
  }
}

// In modules/authentication/repositories/authentication_repository.dart
class AuthenticationRepository {
  Future<User> signup(String email, String password) async {
    final credentials = await _api.signup(email, password);
    return User.authenticated(email: email, id: credentials.userId);
  }
}
```

**Dio HTTP client** is configured in `core/data/api/` with:
- Custom headers (Authorization, User-Agent)
- Request/response logging
- Error handling

## Code Style & Linting

Uses `package:lint/strict.yaml` for strict lint rules:

```bash
flutter analyze  # Check linting errors
dart format lib test  # Auto-format code
```

**Disabled rules** (in `analysis_options.yaml`):
- `require_trailing_commas`: false
- `eol_at_end_of_file`: false

## Important Design Decisions

1. **Black Box Modules**: Each module is independently replaceable. Only expose Riverpod providers.

2. **Repository Pattern**: Separates API details from business logic. Easy to swap implementations.

3. **Freezed + Sealed Classes**: Type-safe union types with exhaustive matching and auto-equality.

4. **Riverpod Notifiers**: Centralized state management that's easy to test with fakes.

5. **Three Layers**: API → Repository → Notifier → UI creates clear separation of concerns.

6. **Async/Await**: No RxDart streams; uses Future-based async patterns with Riverpod.

7. **No Context Passing**: Use Riverpod's `ref` instead of passing BuildContext deep into business logic.

## Common Patterns & Anti-Patterns

### ✓ DO: Use Riverpod for state

```dart
@Riverpod()
class UserNotifier extends _$UserNotifier {
  @override
  Future<User> build() async {
    final repo = ref.watch(userRepositoryProvider);
    return repo.load();
  }
}
```

### ✓ DO: Map entities to domain models

```dart
class UserRepository {
  Future<User> load() async {
    final entity = await _api.getUser();
    return User.fromEntity(entity);
  }
}
```

### ✓ DO: Use package imports

```dart
import 'package:apparence_kit/core/data/models/user.dart';
```

### ✗ AVOID: Exposing API clients from modules

```dart
// Bad: module exposes internal API
final userApiProvider = Provider((ref) => UserApi());

// Good: module exposes repository only
final userRepositoryProvider = Provider((ref) => UserRepository(...));
```

### ✗ AVOID: Business logic in widgets

```dart
// Bad
Widget build(context) {
  return FutureBuilder(
    future: _api.getUser(),  // Business logic in widget
    builder: ...
  );
}

// Good
@riverpod
Future<User> user(Ref ref) async {
  final repo = ref.watch(userRepositoryProvider);
  return repo.load();
}

Widget build(context, ref) {
  final state = ref.watch(userProvider);
  return state.when(
    data: (user) => Text(user.email),
    loading: () => CircularProgressIndicator(),
    error: (err, stack) => Text('Error: $err'),
  );
}
```

### ✗ AVOID: Mixing freezed classes and regular classes

```dart
// Bad: inconsistent models
class User {
  final String email;
  // Manual equality, copyWith needed
}

// Good: use @freezed for all domain models
@freezed
class User with _$User {
  const factory User({required String email}) = _User;
}
```

## Debugging & Development Tips

1. **Use `logger` package** for debug output (better than `print`)
   ```dart
   final logger = Logger();
   logger.i('Info message');
   logger.e('Error: $error');
   ```

2. **DevTools**: Run `flutter pub global activate devtools && devtools` for widget inspection

3. **Hot Reload**: Works for UI changes; restart needed for provider changes

4. **Riverpod Inspector**: Add `RiverpodObserver` to ProviderScope to log state changes

5. **Test with `pumpAndSettle()`**: Waits for all animations/async operations to complete

6. **Check generated files**: Look in `.dart_tool/build/` if code generation fails

## Firebase Setup

Firebase is initialized for push notifications (dev and prod):

```dart
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
```

Configuration files:
- Dev: `lib/firebase_options_dev.dart`
- Prod: Add production Firebase options file (currently uses dev)

For testing, Firebase is mocked in `test/firebase_test_utils.dart`.
