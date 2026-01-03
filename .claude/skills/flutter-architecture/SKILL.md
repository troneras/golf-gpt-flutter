---
name: flutter-architecture
description: Understand TalkCaddy Flutter project structure, clean architecture layers, Riverpod provider hierarchy, and data flow patterns. Use when exploring the codebase, finding where features live, understanding how modules connect, or tracing data from API to UI.
allowed-tools: Read, Grep, Glob
---

# TalkCaddy Flutter Architecture

## Project Overview

**TalkCaddy** is a voice-controlled golf caddie mobile app. Users interact primarily through voice commands via ChatGPT, while this Flutter app handles GPS tracking, round synchronization, and course data.

- **Package**: `apparence_kit` (import path)
- **App Name**: TalkCaddy
- **Base Locale**: Spanish (es), with English (en) fallback

## Three-Layer Clean Architecture

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
└─────────────────────────────────────────────────────────────┘
```

## Directory Structure

```
lib/
├── core/                          # Shared infrastructure
│   ├── data/
│   │   ├── api/                   # HTTP client, core APIs
│   │   ├── entities/              # Raw API response models
│   │   ├── models/                # Domain models (User, etc.)
│   │   └── repositories/          # Core repositories
│   ├── states/                    # Global state (user state)
│   ├── guards/                    # Route protection
│   ├── initializer/               # App startup sequencing
│   ├── theme/                     # Theme system + extensions
│   ├── widgets/                   # Shared UI components
│   └── bottom_menu/               # Bottom navigation
│
├── modules/                       # Feature modules
│   └── module_name/
│       ├── api/                   # Module-specific API
│       │   └── entities/          # Entities returned by API
│       ├── domain/                # Domain models
│       ├── repositories/          # Entity → Domain transform
│       ├── providers/             # Riverpod notifiers
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

## Key Modules

| Module | Purpose |
|--------|---------|
| `authentication` | Sign in/up, social auth, password recovery |
| `voice_caddy` | ChatGPT OAuth connection, voice caddie setup |
| `rounds` | Golf round tracking, scoring |
| `gps` | Location tracking service |
| `bag` | Golf club management |
| `notifications` | Push notifications, device registration |
| `settings` | App settings (view-only) |
| `feedback` | User feedback and feature requests |

## Data Flow Example

```
User taps "Start Round"
        ↓
RoundPage (ConsumerWidget)
        ↓ ref.read(roundPageNotifier.notifier).startRound()
        ↓
RoundPageNotifier (Riverpod)
        ↓ repository.startRound(...)
        ↓
RoundRepository
        ↓ _api.startRound(...)
        ↓
RoundApi → HTTP POST /rounds
        ↓
Returns RoundEntity (raw JSON)
        ↓
Repository transforms to Round (domain model)
        ↓
Notifier updates state
        ↓
Page rebuilds with new data
```

## Key Files to Understand

| File | Purpose |
|------|---------|
| `lib/core/states/user_state_notifier.dart` | Global user authentication state |
| `lib/core/data/api/http_client.dart` | HTTP client with Bearer auth |
| `lib/router.dart` | All app routes |
| `lib/environnements.dart` | Environment configuration |
| `lib/core/bottom_menu/bottom_router.dart` | Bottom navigation setup |

## Provider Patterns

- All providers use `@Riverpod` annotation with code generation
- Use `ref.watch()` in widgets to listen to state
- Use `ref.read()` to call methods without listening
- Global state: `userStateNotifierProvider`
- Module state: `{moduleName}PageNotifierProvider`

## Import Convention

Always use package imports:
```dart
// Correct
import 'package:apparence_kit/core/data/models/user.dart';

// Wrong - never use relative imports
import '../../../data/models/user.dart';
```

## Instructions for Exploration

1. **Find a feature**: Look in `lib/modules/{feature_name}/`
2. **Trace data flow**: Start from UI → provider → repository → api
3. **Find shared code**: Check `lib/core/` for reusable components
4. **Check routes**: Look in `lib/router.dart` for navigation paths
5. **Find translations**: Check `lib/i18n/es.i18n.json` for text keys
