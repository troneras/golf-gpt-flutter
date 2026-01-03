---
name: add-feature
description: Step-by-step guide to add new features to TalkCaddy Flutter app following clean architecture. Use when implementing new functionality, adding API endpoints, creating new screens, or extending existing modules.
---

# Adding Features to TalkCaddy

## Overview

Follow this order when adding features:
1. **API Layer** - Add endpoint call
2. **Entity** - Create response model (if new data)
3. **Domain Model** - Create/update domain model
4. **Repository** - Transform entity → domain
5. **Provider/Notifier** - State management
6. **UI** - Pages, components, widgets
7. **Translations** - Add text strings
8. **Routes** - Add navigation (if new page)

## Step 1: API Layer

**Location**: `lib/modules/{module}/api/{module}_api.dart`

```dart
import 'package:apparence_kit/core/data/api/base_api_exceptions.dart';
import 'package:apparence_kit/core/data/api/http_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myApiProvider = Provider<MyApi>((ref) {
  return MyApi(client: ref.read(httpClientProvider));
});

class MyApi {
  final HttpClient _client;

  MyApi({required HttpClient client}) : _client = client;

  Future<MyEntity> getData(String id) async {
    try {
      final response = await _client.get('/endpoint/$id');
      return MyEntity.fromJson(response.data as Map<String, Object?>);
    } on DioException catch (e) {
      throw ApiError.fromDioException(e);
    }
  }

  Future<void> deleteData(String id) async {
    try {
      await _client.delete('/endpoint/$id');
    } on DioException catch (e) {
      throw ApiError.fromDioException(e);
    }
  }
}
```

## Step 2: Entity (Raw API Model)

**Location**: `lib/modules/{module}/api/entities/{name}_entity.dart`

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_entity.freezed.dart';
part 'my_entity.g.dart';

@freezed
sealed class MyEntity with _$MyEntity {
  const factory MyEntity({
    required String id,
    required String name,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default(false) bool isActive,
  }) = MyEntityData;

  factory MyEntity.fromJson(Map<String, Object?> json) =>
      _$MyEntityFromJson(json);
}
```

## Step 3: Domain Model

**Location**: `lib/modules/{module}/domain/{name}.dart`

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:apparence_kit/modules/{module}/api/entities/my_entity.dart';

part 'my_model.freezed.dart';

@freezed
sealed class MyModel with _$MyModel {
  const factory MyModel({
    required String id,
    required String name,
    DateTime? createdAt,
    required bool isActive,
  }) = MyModelData;

  const MyModel._();

  factory MyModel.fromEntity(MyEntity entity) {
    return MyModel(
      id: entity.id,
      name: entity.name,
      createdAt: entity.createdAt,
      isActive: entity.isActive,
    );
  }

  // Add business logic methods here
  bool get isRecent => createdAt != null &&
      DateTime.now().difference(createdAt!).inDays < 7;
}
```

## Step 4: Repository

**Location**: `lib/modules/{module}/repositories/{module}_repository.dart`

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myRepositoryProvider = Provider<MyRepository>((ref) {
  return MyRepository(api: ref.read(myApiProvider));
});

class MyRepository {
  final MyApi _api;

  MyRepository({required MyApi api}) : _api = api;

  Future<MyModel> get(String id) async {
    final entity = await _api.getData(id);
    return MyModel.fromEntity(entity);
  }

  Future<void> delete(String id) async {
    await _api.deleteData(id);
  }
}
```

## Step 5: Provider/Notifier

**Location**: `lib/modules/{module}/providers/{name}_notifier.dart`

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_page_notifier.g.dart';

@Riverpod(keepAlive: false)
class MyPageNotifier extends _$MyPageNotifier {
  @override
  Future<MyPageState> build() async {
    final repository = ref.read(myRepositoryProvider);
    final data = await repository.get('some-id');
    return MyPageState(data: data);
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(myRepositoryProvider);
      return MyPageState(data: await repository.get('some-id'));
    });
  }

  Future<bool> delete(String id) async {
    try {
      final repository = ref.read(myRepositoryProvider);
      await repository.delete(id);
      await refresh();
      return true;
    } catch (e) {
      return false;
    }
  }
}
```

**State Model** (`lib/modules/{module}/providers/models/{name}_state.dart`):

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_page_state.freezed.dart';

@freezed
sealed class MyPageState with _$MyPageState {
  const factory MyPageState({
    required MyModel data,
    @Default(false) bool isLoading,
    String? error,
  }) = MyPageStateData;
}
```

## Step 6: UI Page

**Location**: `lib/modules/{module}/ui/pages/{name}_page.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myPageNotifierProvider);
    final tr = Translations.of(context).my_module;

    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(title: Text(tr.title)),
      body: state.map(
        data: (data) => _buildContent(context, ref, data.value),
        error: (error) => Center(child: Text(error.error.toString())),
        loading: (_) => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref, MyPageState state) {
    return ListView(
      children: [
        Text(state.data.name),
        // ... more UI
      ],
    );
  }
}
```

## Step 7: Translations

**Add to** `lib/i18n/es.i18n.json`:
```json
"my_module": {
    "title": "Mi Modulo",
    "description": "Descripcion aqui"
}
```

**Add to** `lib/i18n/en.i18n.json`:
```json
"my_module": {
    "title": "My Module",
    "description": "Description here"
}
```

**Regenerate**:
```bash
flutter pub run slang
```

## Step 8: Routes

**Add to** `lib/router.dart`:
```dart
GoRoute(
  path: '/my-feature',
  builder: (context, state) => const MyPage(),
),
```

## Step 9: Generate Code

After adding freezed/riverpod classes:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Checklist

- [ ] API method added with proper error handling
- [ ] Entity with `@freezed` and JSON serialization
- [ ] Domain model with `fromEntity` factory
- [ ] Repository wrapping API calls
- [ ] Notifier with state management
- [ ] Page with `ConsumerWidget` and `state.map()`
- [ ] Translations in both es.i18n.json and en.i18n.json
- [ ] Route added if new page
- [ ] Code generation run (`build_runner`)
- [ ] Translations regenerated (`slang`)
- [ ] `flutter analyze` passes

## Quick Reference: Import Paths

```dart
// Core
import 'package:apparence_kit/core/data/api/http_client.dart';
import 'package:apparence_kit/core/data/api/base_api_exceptions.dart';
import 'package:apparence_kit/core/states/user_state_notifier.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';

// Translations
import 'package:apparence_kit/i18n/translations.g.dart';

// External
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
```
