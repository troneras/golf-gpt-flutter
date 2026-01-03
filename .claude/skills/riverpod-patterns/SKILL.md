---
name: riverpod-patterns
description: Riverpod state management patterns used in TalkCaddy with freezed immutability, async providers, and code generation. Use when creating providers, notifiers, managing state, or working with async data.
---

# Riverpod Patterns in TalkCaddy

## Overview

TalkCaddy uses **Riverpod with code generation**:
- `@Riverpod` annotation for providers
- `@freezed` for immutable state models
- Async providers for data loading
- `ConsumerWidget` for UI binding

## Provider Types

### 1. Simple Provider (Dependency Injection)

For services, repositories, APIs:

```dart
final myRepositoryProvider = Provider<MyRepository>((ref) {
  return MyRepository(api: ref.read(myApiProvider));
});
```

### 2. Async Notifier (Page State)

For pages with async data and actions:

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_page_notifier.g.dart';

@Riverpod(keepAlive: false)  // Dispose when no longer watched
class MyPageNotifier extends _$MyPageNotifier {
  @override
  Future<MyPageState> build() async {
    // Initial data load
    final repository = ref.read(myRepositoryProvider);
    final data = await repository.fetchData();
    return MyPageState(items: data);
  }

  Future<void> addItem(String name) async {
    // Optimistic update pattern
    final currentState = state.valueOrNull;
    if (currentState == null) return;

    state = AsyncValue.data(
      currentState.copyWith(isLoading: true),
    );

    try {
      final repository = ref.read(myRepositoryProvider);
      await repository.addItem(name);
      ref.invalidateSelf();  // Refetch data
    } catch (e) {
      state = AsyncValue.data(
        currentState.copyWith(isLoading: false, error: e.toString()),
      );
    }
  }
}
```

### 3. Keep-Alive Notifier (Global State)

For state that persists across navigation:

```dart
@Riverpod(keepAlive: true)  // Never disposed
class UserStateNotifier extends _$UserStateNotifier {
  @override
  UserState build() {
    return const UserState(user: User.loading());
  }

  Future<void> onSignin() async {
    // Update global state
  }
}
```

## State Model Patterns

### Basic State with Freezed

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_page_state.freezed.dart';

@freezed
sealed class MyPageState with _$MyPageState {
  const factory MyPageState({
    required List<Item> items,
    @Default(false) bool isLoading,
    String? error,
    Item? selectedItem,
  }) = MyPageStateData;
}
```

### Union Type State (Loading/Error/Data)

```dart
@freezed
sealed class User with _$User {
  const factory User.authenticated({
    required String email,
    String? name,
    required String id,
  }) = AuthenticatedUserData;

  const factory User.loading() = LoadingUserData;

  const factory User.unauthenticated() = UnauthenticatedUserData;

  const User._();

  // Computed properties
  bool get isAuthenticated => this is AuthenticatedUserData;

  String get idOrThrow {
    if (this is AuthenticatedUserData) {
      return (this as AuthenticatedUserData).id;
    }
    throw Exception('User not authenticated');
  }
}
```

## UI Binding Patterns

### ConsumerWidget (Stateless)

```dart
class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch state (rebuilds on change)
    final state = ref.watch(myPageNotifierProvider);

    return state.map(
      data: (data) => _Content(state: data.value),
      error: (error) => _ErrorView(error: error.error),
      loading: (_) => const _LoadingView(),
    );
  }
}
```

### ConsumerStatefulWidget (Stateful)

```dart
class MyPage extends ConsumerStatefulWidget {
  const MyPage({super.key});

  @override
  ConsumerState<MyPage> createState() => _MyPageState();
}

class _MyPageState extends ConsumerState<MyPage> {
  @override
  void initState() {
    super.initState();
    // Can access ref here
    ref.read(myNotifierProvider.notifier).init();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(myPageNotifierProvider);
    return Scaffold(/* ... */);
  }
}
```

## Common Patterns

### Reading vs Watching

```dart
// WATCH - Rebuilds widget when state changes
final state = ref.watch(myProvider);

// READ - One-time read, no rebuild
final notifier = ref.read(myProvider.notifier);
await notifier.doAction();
```

### Calling Actions

```dart
// In a button callback
onPressed: () {
  ref.read(myProvider.notifier).doAction();
}

// Async action with result
onPressed: () async {
  final success = await ref.read(myProvider.notifier).doAction();
  if (!context.mounted) return;
  if (success) {
    context.pop();
  }
}
```

### Invalidate and Refresh

```dart
// Force rebuild from scratch
ref.invalidateSelf();

// Or from outside
ref.invalidate(myProvider);

// Refresh and wait for result
await ref.refresh(myProvider.future);
```

### Listen to State Changes

```dart
ref.listen(myProvider, (previous, next) {
  if (next.hasError) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(next.error.toString())),
    );
  }
});
```

## Guard Patterns

### Check State Before Async

```dart
Future<void> doAction() async {
  final userState = ref.read(userStateNotifierProvider);
  if (!userState.user.isAuthenticated) return;

  // Safe to proceed
  final userId = userState.user.idOrThrow;
  // ...
}
```

### Guard Context After Async

```dart
Future<void> _handleAction(BuildContext context, WidgetRef ref) async {
  final success = await ref.read(myProvider.notifier).doAction();

  if (!context.mounted) return;  // Widget may have been disposed

  if (success) {
    context.pop();
  } else {
    ScaffoldMessenger.of(context).showSnackBar(/* ... */);
  }
}
```

## Code Generation

After creating/modifying providers:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Or watch mode:
```bash
flutter pub run build_runner watch
```

## File Organization

```
providers/
├── my_page_notifier.dart      # Notifier class
├── my_page_notifier.g.dart    # Generated
└── models/
    ├── my_page_state.dart     # State class
    └── my_page_state.freezed.dart  # Generated
```

## Common Imports

```dart
// Core Riverpod
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Freezed
import 'package:freezed_annotation/freezed_annotation.dart';

// Project state
import 'package:apparence_kit/core/states/user_state_notifier.dart';
```

## Key Providers in Codebase

| Provider | Purpose |
|----------|---------|
| `userStateNotifierProvider` | Global auth state |
| `voiceCaddyProvider` | Voice caddy connection state |
| `httpClientProvider` | HTTP client with auth |
| `environmentProvider` | Environment config |

## Anti-Patterns to Avoid

```dart
// DON'T: Use .then() with providers
ref.read(myProvider.notifier).doAction().then((_) { }); // Bad

// DO: Use async/await
await ref.read(myProvider.notifier).doAction(); // Good

// DON'T: Watch in callbacks
onPressed: () {
  ref.watch(myProvider); // Bad - causes rebuild during gesture
}

// DO: Read in callbacks
onPressed: () {
  ref.read(myProvider.notifier).action(); // Good
}
```
