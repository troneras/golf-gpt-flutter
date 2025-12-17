# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**TalkCaddy** is a voice-controlled golf caddie mobile app. Users interact primarily through voice commands via ChatGPT, while this Flutter app handles GPS tracking, round synchronization, and course data.

- **App Name**: TalkCaddy
- **Package**: `io.talkcaddy`
- **Base Locale**: Spanish (es), with English (en) support

## Quick Reference: Common Commands

```bash
# Code generation (freezed, riverpod, json_serializable)
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run build_runner watch  # Regenerate on file changes

# Translations (Slang)
flutter pub run slang               # Regenerate translations

# App icons & splash screen
flutter pub run flutter_launcher_icons  # Generate launcher icons
flutter pub run flutter_native_splash:create  # Generate splash screen

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
```

## Dart General Guidelines

### Basic Principles

- Use English for all code and documentation
- Always declare the type of each variable and function (parameters and return value)
- Use descriptive variable names that explain their purpose
- Avoid using `dynamic` type - create necessary types instead
- Don't leave blank lines within a function
- One export per file
- Prefer super constructor syntax

### Nomenclature

| Element | Convention | Example |
|---------|------------|---------|
| Classes | PascalCase | `UserRepository`, `SigninPage` |
| Variables/Methods | camelCase | `getUserById()`, `isLoading` |
| Files/Directories | snake_case | `user_repository.dart` |
| Constants | camelCase | `defaultTimeout` |
| Boolean variables | Verb prefix | `isLoading`, `hasError`, `canDelete` |

**Rules:**
- Start each function/method with a verb
- Use complete words instead of abbreviations (except: `i`, `j` for loops, `err` for errors, `ctx` for contexts)
- Standard abbreviations OK: API, URL, etc.
- Prefer nouns for class names, verbs for methods
- Avoid magic numbers - define constants

### Imports

**ALWAYS use package imports, never relative imports:**

```dart
// ✓ CORRECT
import 'package:apparence_kit/core/data/models/user.dart';
import 'package:apparence_kit/modules/authentication/providers/signin_state_provider.dart';

// ✗ WRONG - Never do this
import '../../../data/models/user.dart';
import '../../providers/signin_state_provider.dart';
```

Package name is `apparence_kit`.

## Architecture Overview

Built with Flutter using the **ApparenceKit design system**. Follows a three-layer clean architecture:

```
┌─────────────────────────────────────────────────────────────┐
│                    PRESENTATION LAYER                        │
│  ConsumerWidget → watches Riverpod Notifier/Provider        │
│  - Pages, Components, Widgets                                │
│  - Listens to immutable state from Notifier                 │
└─────────────────────────────────────────────────────────────┘
                              ↑
┌─────────────────────────────────────────────────────────────┐
│                      DOMAIN LAYER                            │
│  Repository → transforms Entity to Domain Model             │
│  - Business logic lives here                                 │
│  - Returns domain models (User, not UserEntity)             │
└─────────────────────────────────────────────────────────────┘
                              ↑
┌─────────────────────────────────────────────────────────────┐
│                       DATA LAYER                             │
│  API classes → fetch from server/Firebase/Supabase          │
│  - Returns Entities (raw data objects)                      │
│  - Handles serialization/parsing                            │
│  - NOT unit tested (external dependencies)                  │
└─────────────────────────────────────────────────────────────┘
```

## Directory Structure

```
lib/
├── core/                          # Shared infrastructure
│   ├── data/
│   │   ├── api/                   # HTTP client + core APIs (shared across modules)
│   │   ├── entities/              # Raw API response models
│   │   ├── models/                # Domain models (User, Subscription, etc.)
│   │   └── repositories/          # Core repositories
│   ├── states/                    # Global state (user state)
│   │   └── models/
│   ├── guards/                    # Route protection
│   ├── initializer/               # App startup sequencing
│   ├── theme/                     # Theme system + extensions
│   ├── widgets/                   # Shared UI components
│   ├── security/                  # Token storage
│   ├── rating/                    # Rating module
│   └── bottom_menu/               # Bottom navigation
│
├── modules/                       # Feature modules
│   └── module_name/
│       ├── api/                   # Module-specific API classes
│       │   └── entities/          # Entities returned by API
│       ├── domain/                # Domain models (returned by repositories)
│       ├── repositories/          # Transform entities → domain
│       ├── providers/             # Riverpod notifiers (UI state)
│       │   └── models/            # Page state models (freezed)
│       └── ui/
│           ├── pages/             # Full-screen views
│           ├── components/        # Uses provider + domain
│           └── widgets/           # Dumb widgets (Flutter only)
│
├── i18n/                          # Translations (Slang)
│   ├── es.i18n.json               # Spanish (base locale)
│   ├── en.i18n.json               # English
│   └── translations*.g.dart       # Generated
│
├── router.dart                    # GoRouter configuration
└── main.dart                      # App entry point
```

## Layer Examples

### 1. Data Layer (API)

API classes fetch data and return **Entities**:

```dart
final userApiProvider = Provider<UserApi>(
  (ref) => UserApi(
    client: Supabase.instance.client,
    storageApi: ref.read(storageApiProvider),
  ),
);

class UserApi {
  final SupabaseClient _client;
  final StorageApi _storageApi;

  UserApi({
    required SupabaseClient client,
    required StorageApi storageApi,
  }) : _client = client, _storageApi = storageApi;

  Future<UserEntity?> get(String id) async {
    try {
      final res = await _client
          .from('users')
          .select()
          .eq('id', id);
      if (res.isEmpty) {
        return null;
      }
      return UserEntity.fromJson(res.first);
    } catch (e, stacktrace) {
      throw ApiError(code: 0, message: '$e: $stacktrace');
    }
  }
}
```

**Rules:**
- Create a provider to inject API into repositories
- Only repositories use API classes directly
- API returns entities (raw data objects)

### 2. Domain Layer (Repository)

Repositories transform **Entities → Domain Models**:

```dart
final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepository(
    userApi: ref.read(userApiProvider),
    subscriptionRepository: ref.read(subscriptionRepositoryProvider),
  ),
);

class UserRepository {
  final UserApi _userApi;
  final SubscriptionRepository _subscriptionRepository;

  UserRepository({
    required UserApi userApi,
    required SubscriptionRepository subscriptionRepository,
  }) : _userApi = userApi, _subscriptionRepository = subscriptionRepository;

  Future<User?> get(String id) async {
    final userEntity = await _userApi.get(id);
    if (userEntity == null) {
      return null;
    }
    return User.fromEntity(userEntity);
  }
}
```

**Domain Model Example (using freezed):**

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
sealed class User with _$User {
  const factory User.authenticated({
    required String email,
    String? name,
    String? id,
    DateTime? creationDate,
    required bool onboarded,
    Subscription? subscription,
  }) = AuthenticatedUserData;

  const factory User.loading() = LoadingUserData;

  const factory User.unauthenticated() = UnauthenticatedUserData;

  const User._();
}
```

**Rules:**
- Use `@freezed` for immutability and union types
- Create typed wrappers (e.g., `Email` not `String`) for validation
- Domain models can aggregate data from multiple sources

### 3. Presentation Layer (Notifier + Page)

**Page Notifier** (state management):

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feedback_page_notifier.g.dart';

@Riverpod(keepAlive: false)
class FeedbackPageNotifier extends _$FeedbackPageNotifier {
  @override
  Future<FeedbackPageState> build() async {
    final featureRequestRepository = ref.read(featureRequestRepositoryProvider);
    final userState = ref.read(userStateNotifierProvider);

    final userVotes = await featureRequestRepository.getUserVotes(userState.user.idOrThrow);
    final features = await featureRequestRepository.getActiveFeatureRequests();
    features.sort((a, b) => b.votes.compareTo(a.votes));

    return FeedbackPageState(
      featureRequests: features,
      userVotes: userVotes,
    );
  }
}
```

**Page** (UI):

```dart
class FeedbackPage extends ConsumerWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(feedbackPageNotifierProvider);
    final translations = Translations.of(context).feature_requests;

    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: state.map(
          data: (data) {
            if (data.value.featureRequests.isEmpty) {
              return Center(child: Text("No feature requests yet"));
            }
            return ListView.builder(
              itemCount: data.value.featureRequests.length,
              itemBuilder: (context, index) => FeatureCard(
                title: data.value.featureRequests[index].title,
                onVote: () {
                  ref.read(feedbackPageNotifierProvider.notifier)
                      .vote(data.value.featureRequests[index]);
                },
              ),
            );
          },
          error: (error) => Center(child: Text(error.error.toString())),
          loading: (_) => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
```

**Rules:**
- Notifier state uses freezed for immutability
- Page watches notifier with `ref.watch()`
- Page triggers actions via `ref.read(notifier).method()`
- Use `state.map()` for handling loading/error/data states

## App Flow

### Onboarding Flow (new users)
```
/onboarding
  ├── welcome          → "Tu caddie por voz"
  ├── app_purpose      → Feature explanation with bullets
  └── location_permission → GPS permission request
      ↓
/signin                → "Conecta tu caddie" login screen
      ↓
/complete              → "Todo listo" success screen
      ↓
/                      → Main app (home)
```

### Routes
- `/` - Home (protected by UserInfoGuard)
- `/onboarding` - Onboarding flow
- `/signin` - Login screen
- `/signup` - Registration screen
- `/complete` - Post-login completion screen
- `/recover_password` - Password recovery

## Localization (Slang)

**Base locale is Spanish (es)**. Translations are in `lib/i18n/`:

```dart
import 'package:apparence_kit/i18n/translations.g.dart';

// In widgets
final tr = Translations.of(context);
Text(tr.onboarding.welcome.title);  // "Tu caddie por voz"
Text(tr.auth.signin.title);         // "Conecta tu caddie"
```

Configuration in `slang.yaml`:
- Base locale: `es` (Spanish)
- Fallback strategy: base_locale
- Input: `lib/i18n/*.i18n.json`
- Output: `lib/i18n/translations*.g.dart`

**Regenerate translations:**
```bash
flutter pub run slang
```

## Assets Configuration

### Launcher Icons
```yaml
flutter_launcher_icons:
  ios: true
  android: true
  image_path_ios: "assets/launcher/icon.png"
  image_path_android: "assets/launcher/icon.png"
  adaptive_icon_background: "assets/launcher/background.png"
  adaptive_icon_foreground: "assets/launcher/foreground.png"
```

### Splash Screen
```yaml
flutter_native_splash:
  color: "#FFFFFF"
  fullscreen: true
  image: assets/images/splashscreen.png
  android_12:
    color: "#FFFFFF"
    image: assets/images/splashscreen.png
```

## Authentication

- **Social login**: Google Sign-In, Apple Sign-In (iOS only)
- **Email/password**: Traditional auth flow
- **Auth-required**: Users must authenticate to use the app

### Google Sign-In (v7.x API)
```dart
await GoogleSignIn.instance.initialize(
  clientId: const String.fromEnvironment('GOOGLE_CLIENT_ID'),
);
final result = await GoogleSignIn.instance.authenticate();
```

## Theme System

Access via BuildContext extensions:
```dart
context.colors.primary
context.colors.onBackground
context.textTheme.headlineLarge
```

## Firebase Configuration

- Android: `android/app/google-services.json`
- iOS: Configure in Xcode with GoogleService-Info.plist
- Project: `talkcaddy` (Firebase project ID)

## Code Generation

Three generators used:
1. **Freezed** - Immutable data classes with union types
2. **json_serializable** - JSON parsing for entities
3. **Riverpod Generator** - State management providers

Run all:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Important Design Decisions

1. **Black Box Modules**: Each module is independently replaceable
2. **Repository Pattern**: Separates API from business logic
3. **Freezed + Sealed Classes**: Type-safe union types with exhaustive matching
4. **Spanish-first localization**: Base locale is Spanish
5. **Voice-first UX**: App designed to complement ChatGPT voice interface
6. **Typed Domain Models**: Use wrapper types (Email, not String) for validation

## Debugging Tips

1. Use `logger` package for debug output
2. Hot reload works for UI; restart needed for provider changes
3. Check generated files in `.dart_tool/build/` if generation fails
4. For splash screen testing, force-close app and relaunch (cold start)
5. Don't forget to add required imports for each new file
