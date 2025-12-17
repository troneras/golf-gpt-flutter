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

## Architecture Overview

Built with Flutter using the **ApparenceKit design system**. Follows a three-layer clean architecture pattern with explicit black box boundaries between modules.

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
│   ├── authentication/            # Email, social login (Google, Apple)
│   ├── onboarding/                # 3-screen onboarding + completion
│   ├── notifications/             # Push notifications
│   ├── settings/                  # User preferences
│   └── home/                      # Main app navigation
│
├── i18n/                          # Translations (Slang)
│   ├── es.i18n.json               # Spanish (base locale)
│   ├── en.i18n.json               # English
│   └── translations*.g.dart       # Generated translation classes
│
├── router.dart                    # GoRouter configuration & navigation
└── main.dart                      # App entry point
```

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

**Regenerate translations**:
```bash
flutter pub run slang
```

### Translation Structure
```json
{
  "onboarding": {
    "welcome": { "title", "subtitle", "action" },
    "app_purpose": { "title", "bullet_1-3", "key_message", "action" },
    "location_permission": { "title", "description", "bullet_1-3", "reassurance", "action", "skip" },
    "complete": { "title", "subtitle", "command", "action" }
  },
  "auth": {
    "or_sign_in_with",
    "signin": { "title", "subtitle", "email_label", ... },
    "signup": { ... }
  },
  "common": { "continue", "cancel", "skip", ... }
}
```

## Assets Configuration

### Launcher Icons
Configuration in `pubspec.yaml`:
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

### Asset Directories
```
assets/
├── images/
│   ├── onboarding/
│   │   ├── ilustracion-golfista-caminando.png
│   │   └── ilustracion-golf-gps.png
│   └── splashscreen.png
├── launcher/
│   ├── icon.png
│   ├── background.png
│   └── foreground.png
└── icons/
```

## State Management: Riverpod 3.x

Uses `@riverpod` annotations with code generation:

```dart
@Riverpod(keepAlive: true)
class UserStateNotifier extends _$UserStateNotifier {
  @override
  UserState build() => UserState.loading();
  Future<void> loadUser() async { ... }
}
```

## Authentication

- **Social login**: Google Sign-In, Apple Sign-In (iOS only)
- **Email/password**: Traditional auth flow
- **Anonymous-first**: Users can use app without login, then upgrade

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
1. **Freezed** - Immutable data classes
2. **json_serializable** - JSON parsing
3. **Riverpod Generator** - State management

Run all:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Naming Conventions

- **Classes**: PascalCase (`UserRepository`, `SigninPage`)
- **Variables/Methods**: camelCase (`getUserById()`, `isLoading`)
- **Files/Directories**: snake_case (`user_repository.dart`)
- **Package imports**: Always use package imports
  ```dart
  import 'package:apparence_kit/core/data/models/user.dart';  // ✓
  import '../../../data/models/user.dart';                     // ✗
  ```

## Important Design Decisions

1. **Black Box Modules**: Each module is independently replaceable
2. **Repository Pattern**: Separates API from business logic
3. **Freezed + Sealed Classes**: Type-safe union types
4. **Spanish-first localization**: Base locale is Spanish
5. **Voice-first UX**: App designed to complement ChatGPT voice interface

## Debugging Tips

1. Use `logger` package for debug output
2. Hot reload works for UI; restart needed for provider changes
3. Check generated files in `.dart_tool/build/` if generation fails
4. For splash screen testing, force-close app and relaunch (cold start)
