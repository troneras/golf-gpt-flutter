---
name: translations-workflow
description: Add and manage translations in TalkCaddy using Slang. Use when adding new text strings, updating translations, or working with localized content. Spanish is the base locale, English is the fallback.
---

# Translations Workflow (Slang)

## Overview

TalkCaddy uses **Slang** for internationalization:
- **Base locale**: Spanish (es) - `lib/i18n/es.i18n.json`
- **Fallback**: English (en) - `lib/i18n/en.i18n.json`
- **Generated files**: `lib/i18n/translations*.g.dart`

## Quick Start

### 1. Add translations to both JSON files

**Spanish** (`lib/i18n/es.i18n.json`):
```json
"my_feature": {
    "title": "Mi Caracteristica",
    "description": "Una descripcion aqui",
    "button": "Presionar"
}
```

**English** (`lib/i18n/en.i18n.json`):
```json
"my_feature": {
    "title": "My Feature",
    "description": "A description here",
    "button": "Press"
}
```

### 2. Regenerate translations

```bash
flutter pub run slang
```

### 3. Use in code

```dart
import 'package:apparence_kit/i18n/translations.g.dart';

// In a widget
final tr = Translations.of(context).my_feature;
Text(tr.title);        // "Mi Caracteristica" or "My Feature"
Text(tr.description);  // Based on device locale
```

## JSON Structure

Translations are nested objects. Structure should match feature organization:

```json
{
    "common": {
        "ok": "OK",
        "cancel": "Cancelar",
        "save": "Guardar",
        "delete": "Eliminar",
        "error": "Error",
        "loading": "Cargando..."
    },
    "auth": {
        "signin": {
            "title": "Iniciar Sesion",
            "email": "Correo electronico",
            "password": "Contrasena",
            "button": "Entrar"
        },
        "signup": {
            "title": "Crear Cuenta"
        }
    },
    "settings": {
        "title": "Ajustes",
        "disconnect": "Cerrar Sesion"
    }
}
```

## Parameterized Strings

Use `{param}` syntax for dynamic values:

```json
"greeting": "Hola, {name}!",
"items_count": "Tienes {count} elementos"
```

Usage:
```dart
tr.greeting(name: 'Juan');        // "Hola, Juan!"
tr.items_count(count: 5);         // "Tienes 5 elementos"
```

## Pluralization

Use Slang's built-in plural support:

```json
"items": {
    "zero": "No hay elementos",
    "one": "1 elemento",
    "other": "{n} elementos"
}
```

Usage:
```dart
tr.items(n: 0);   // "No hay elementos"
tr.items(n: 1);   // "1 elemento"
tr.items(n: 5);   // "5 elementos"
```

## Best Practices

### DO:
- Always add to BOTH es.i18n.json AND en.i18n.json
- Use nested structure matching your module organization
- Keep keys in snake_case
- Use descriptive keys (`signin_button` not `btn1`)
- Group related strings together

### DON'T:
- Don't hardcode text in widgets
- Don't forget to run `flutter pub run slang` after changes
- Don't use duplicate keys
- Don't leave English text in Spanish file (or vice versa)

## Common Translation Keys

Already available in the codebase:

```dart
// Common actions
Translations.of(context).common.ok
Translations.of(context).common.cancel
Translations.of(context).common.save
Translations.of(context).common.delete
Translations.of(context).common.error

// Settings
Translations.of(context).settings.disconnect
Translations.of(context).settings.delete_account

// Voice Caddy
Translations.of(context).voice_caddy.settings.title
Translations.of(context).voice_caddy.settings.connected
Translations.of(context).voice_caddy.settings.not_connected
```

## File Locations

| File | Purpose |
|------|---------|
| `lib/i18n/es.i18n.json` | Spanish translations (base) |
| `lib/i18n/en.i18n.json` | English translations |
| `lib/i18n/translations.g.dart` | Generated main file |
| `lib/i18n/translations_es.g.dart` | Generated Spanish |
| `lib/i18n/translations_en.g.dart` | Generated English |
| `slang.yaml` | Slang configuration |

## Slang Configuration

Located in `slang.yaml`:
```yaml
base_locale: es
fallback_strategy: base_locale
input_directory: lib/i18n
input_file_pattern: .i18n.json
output_directory: lib/i18n
```

## Workflow Checklist

- [ ] Add Spanish text to `es.i18n.json`
- [ ] Add English text to `en.i18n.json`
- [ ] Run `flutter pub run slang`
- [ ] Import `translations.g.dart` in your widget
- [ ] Use `Translations.of(context).your_key`
- [ ] Test in both Spanish and English
