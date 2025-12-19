# Round Management Implementation Plan

## Overview

This document describes the API and data transfer layer for managing a golf round from the Flutter app, covering:
1. Starting a round (after course/tee selection)
2. Real-time score tracking with 18-hole scorecard
3. Pull-to-refresh for ChatGPT caddy updates
4. Finishing the round

---

## API Strategy

### Hybrid Approach

| Operation | Endpoint | Rationale |
|-----------|----------|-----------|
| Start Round | `POST /api/rounds` | Returns round with course/tee data |
| Get Scorecard | `GET /api/rounds/{id}` | Returns all scores with pars |
| Update Score | `POST /v1/scores/upsert` | Idempotent, returns running totals |
| Toggle Settings | `PUT /api/rounds/{id}` | Update gps_enabled/chatgpt_enabled |
| Finish Round | `POST /v1/rounds/finish` | Returns summary stats |

---

## Data Flow

### 1. Start Round Flow

```
SelectCoursePage (user has course + tee selected)
    ↓ User clicks "Iniciar Ronda"
POST /api/rounds { course_id, tee_id, gps_enabled, chatgpt_enabled: true }
    ↓ Returns { round: { id, course, tee, status, scores: [], ... } }
Navigate to RoundInProgressPage
    ↓ Display empty scorecard with pars from course.pars_men
```

### 2. Get Round State (Pull to Refresh)

```
GET /api/rounds/{roundId}
Response:
{
  "round": {
    "id": "uuid",
    "course": {
      "name": "Pebble Beach",
      "pars_men": [4, 5, 4, 4, 3, 5, 3, 4, 4, 4, 4, 3, 4, 5, 4, 4, 3, 5]
    },
    "tee": { "id": "...", "name": "Blue", "color": "#0000FF" },
    "scores": [
      { "hole_number": 1, "strokes": 4, "putts": 2, "par": 4, "score_name": "Par" },
      ...
    ]
  }
}
```

### 3. Score Update Flow

```
User taps hole or +/- button
    ↓ Optimistic UI update
POST /v1/scores/upsert {
  "roundId": "uuid",
  "hole": 5,
  "strokes": 4,
  "putts": 2,
  "penalties": 0
}
    ↓ Response
{
  "ok": true,
  "score": { "hole": 5, "strokes": 4, "putts": 2, "scoreName": "Par" },
  "running": { "totalStrokes": 20, "holesPlayed": 5, "relativeToPar": 2 }
}
```

### 4. Finish Round Flow

```
User taps "Finalizar Ronda"
    ↓ Confirmation dialog
POST /v1/rounds/finish { "notes": "Great round!" }
    ↓ Returns summary
{
  "ok": true,
  "summary": {
    "totalStrokes": 82,
    "relativeToPar": 10,
    "totalPutts": 32,
    "fairwaysHit": 8,
    "fairwaysTotal": 14,
    "gir": 6,
    "girTotal": 18
  }
}
    ↓ Navigate to RoundSummaryPage
```

---

## File Structure

```
lib/modules/round/
├── api/
│   ├── round_api.dart              # HTTP calls
│   └── entities/
│       ├── round_entity.dart       # JSON-serializable
│       ├── hole_score_entity.dart
│       └── score_upsert_response.dart
├── domain/
│   ├── round.dart                  # Domain model
│   ├── hole_score.dart
│   └── running_score.dart
├── repositories/
│   └── round_repository.dart       # Entity → Domain transforms
├── providers/
│   ├── active_round_notifier.dart  # Main state management
│   └── models/
│       └── active_round_state.dart # Freezed union state
└── ui/
    ├── round_in_progress_page.dart # Main scorecard screen
    ├── round_summary_page.dart     # Post-round stats
    └── widgets/
        ├── round_header.dart       # Course/score summary
        ├── hole_score_cell.dart    # Individual hole row
        ├── scorecard_grid.dart     # 18-hole grid with subtotals
        └── score_input_sheet.dart  # Bottom sheet for editing
```

---

## State Management

### ActiveRoundState (Freezed Union)

```dart
@freezed
sealed class ActiveRoundState with _$ActiveRoundState {
  const factory ActiveRoundState.initial() = ActiveRoundStateInitial;
  const factory ActiveRoundState.loading() = ActiveRoundStateLoading;
  const factory ActiveRoundState.active({
    required Round round,
    required int currentHole,
    @Default(false) bool isSaving,
    String? savingError,
  }) = ActiveRoundStateActive;
  const factory ActiveRoundState.finished({
    required String roundId,
    required RoundSummary summary,
  }) = ActiveRoundStateFinished;
  const factory ActiveRoundState.error({
    required String message,
    String? roundId,
  }) = ActiveRoundStateError;
}
```

### ActiveRoundNotifier Methods

| Method | Description |
|--------|-------------|
| `startRound(courseId, teeId, gpsEnabled)` | Start a new round |
| `loadRound(roundId)` | Load existing round by ID |
| `refresh()` | Pull-to-refresh current round |
| `updateScore(hole, strokes, putts, penalties)` | Update hole score with optimistic UI |
| `incrementStrokes(hole)` | Quick +1 stroke |
| `decrementStrokes(hole)` | Quick -1 stroke |
| `setGpsEnabled(enabled)` | Toggle GPS mid-round |
| `finishRound(notes)` | Finish and get summary |
| `clear()` | Reset to initial state |

---

## UI Wireframe

```
┌─────────────────────────────────────────────┐
│  ← Ronda en curso                  ⚙️ GPS   │
├─────────────────────────────────────────────┤
│  Pebble Beach • Blue Tees                   │
│  +6 (78 strokes) • 12/18 holes              │
├─────────────────────────────────────────────┤
│  HOYO │ YDS │ PAR │ SCORE │ +/-             │
│  ─────┼─────┼─────┼───────┼────             │
│    1  │ 380 │  4  │   4   │  E              │
│    2  │ 502 │  5  │   5   │  E              │
│    ...                                      │
│  ─────┼─────┼─────┼───────┼────             │
│  OUT  │3259 │ 36  │  39   │ +3              │
│  ─────┼─────┼─────┼───────┼────             │
│   10  │ 495 │  5  │   5   │  E              │
│ ▶ 11  │ 380 │  4  │   -   │  -  [−][+]     │
│   ...                                       │
│  ─────┼─────┼─────┼───────┼────             │
│  IN   │3412 │ 36  │   -   │  -              │
│  ─────┼─────┼─────┼───────┼────             │
│ TOTAL │6671 │ 72  │  44+  │ +3+             │
├─────────────────────────────────────────────┤
│           [  Finalizar Ronda  ]             │
└─────────────────────────────────────────────┘
```

### Score Input Sheet (tap on any hole)

```
┌─────────────────────────────────────────────┐
│         Hoyo 11 • Par 4 • 380 yds           │
├─────────────────────────────────────────────┤
│  Golpes       [ − ]      5      [ + ]       │
│  Putts        [ − ]      2      [ + ]       │
│  Penaltis     [ − ]      0      [ + ]       │
├─────────────────────────────────────────────┤
│             [  Guardar  ]                   │
└─────────────────────────────────────────────┘
```

---

## Routes

| Route | Page | Parameters |
|-------|------|------------|
| `/round-in-progress` | RoundInProgressPage | `roundId` (optional) |
| `/round-summary` | RoundSummaryPage | `roundId`, `summary` |

---

## Implementation Status

- [x] Phase 1: API entities and round_api.dart
- [x] Phase 2: Domain models and repository
- [x] Phase 3: State management (Riverpod notifier)
- [x] Phase 4: UI components (widgets)
- [x] Phase 5: Pages and navigation
- [x] Phase 6: Polish (error handling, loading states, localization)

---

## Next Steps

1. Run `flutter pub run build_runner build --delete-conflicting-outputs` to generate Freezed/JSON files
2. Test the complete flow from course selection to round summary
3. Add GPS toggle to SelectCoursePage UI (currently hardcoded to true)
4. Consider adding sound/haptic feedback for score changes
