---
name: android-release
description: Create Android release for TalkCaddy. Use when building a new release, bumping version, creating app bundle for Play Store, or generating release notes. Handles version bump, build, release notes in Spanish/English, and commit.
---

# Android Release Process

## Overview

Complete workflow for releasing TalkCaddy to Google Play Store:
1. Bump version in `pubspec.yaml`
2. Build production app bundle
3. Generate release notes (Spanish + English)
4. Commit version bump
5. Upload to Play Console

## Step 1: Check Current Version

```bash
grep -E "^version:" pubspec.yaml
```

Version format: `major.minor.patch+buildNumber` (e.g., `1.1.0+2`)

## Step 2: Determine Version Bump

Follow **Semantic Versioning**:

| Change Type | Bump | Example |
|-------------|------|---------|
| Bug fixes only | Patch | 1.0.0 → 1.0.1 |
| New feature (backwards compatible) | Minor | 1.0.1 → 1.1.0 |
| Breaking changes | Major | 1.1.0 → 2.0.0 |

**Important**: Always increment the build number (`+N`) - Play Store requires unique build numbers.

## Step 3: Review Changes for Release Notes

```bash
# See commits since last release
git log --oneline -10

# Or since a specific tag/commit
git log --oneline <last-release-commit>..HEAD
```

Categorize changes:
- `feat:` → New features
- `fix:` → Bug fixes
- `perf:` → Performance improvements
- `chore:` → Maintenance (don't include in user-facing notes)

## Step 4: Bump Version

Edit `pubspec.yaml`:

```yaml
version: X.Y.Z+N  # e.g., 1.1.0+2
```

## Step 5: Build Production App Bundle

```bash
make build-appbundle-prod
```

This command:
- Builds release app bundle with production environment
- Includes Sentry DSN for crash reporting
- Uploads debug symbols to Sentry
- Creates Sentry release

**Output**: `build/app/outputs/bundle/release/app-release.aab`

## Step 6: Generate Release Notes

Format for Play Console (both languages required):

```
<es-ES>
Novedades en esta versión:

• [Feature 1 in Spanish]
• [Feature 2 in Spanish]
• [Bug fix in Spanish]

¡Gracias por usar TalkCaddy! Tu caddie de voz para el golf.
</es-ES>

<en-US>
What's new in this version:

• [Feature 1 in English]
• [Feature 2 in English]
• [Bug fix in English]

Thank you for using TalkCaddy! Your voice caddy for golf.
</en-US>
```

### Release Notes Guidelines

- Start with most important/visible changes
- Use action verbs: "Added", "Fixed", "Improved"
- Keep bullet points concise (1 line each)
- Don't mention internal/technical changes
- Always end with thank you message

### Common Phrases

| English | Spanish |
|---------|---------|
| New option to... | Nueva opción para... |
| Added support for... | Añadido soporte para... |
| Fixed a bug that... | Corregido un error que... |
| Improved performance of... | Mejorado el rendimiento de... |
| Stability improvements | Mejoras de estabilidad |
| Bug fixes and improvements | Correcciones y mejoras |

## Step 7: Commit Version Bump

```bash
git add pubspec.yaml
git commit -m "chore: Bump version to X.Y.Z+N for release

Release highlights:
- [Highlight 1]
- [Highlight 2]
- [Highlight 3]

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>"
```

## Step 8: Upload to Play Console

1. Go to [Google Play Console](https://play.google.com/console)
2. Select TalkCaddy app
3. Go to Release > Production (or Testing track)
4. Create new release
5. Upload `app-release.aab`
6. Add release name: `X.Y.Z` (e.g., `1.1.0`)
7. Paste release notes for each language
8. Review and roll out

## Quick Reference

### Make Targets

```bash
make build-appbundle-prod  # Production bundle with Sentry
make build-apk-prod        # Production APK with Sentry
make build-appbundle       # Dev bundle (no Sentry)
```

### File Locations

| File | Purpose |
|------|---------|
| `pubspec.yaml` | Version definition |
| `build/app/outputs/bundle/release/app-release.aab` | Output bundle |
| `.env` | Environment variables for build |
| `Makefile` | Build commands |

### Environment Variables (from .env)

Required for production builds:
- `BACKEND_URL_PROD` - Production API URL
- `GOOGLE_SERVER_CLIENT_ID` - Google Sign-In
- `SENTRY_DSN` - Crash reporting
- `SENTRY_AUTH_TOKEN` - Upload debug symbols
- `MIXPANEL_TOKEN` - Analytics
- `GPT_ID_PROD` - Production GPT ID

## Checklist

- [ ] Review commits for release notes content
- [ ] Bump version following semver
- [ ] Run `make build-appbundle-prod`
- [ ] Verify build succeeds (check for `.aab` file)
- [ ] Verify Sentry symbols uploaded
- [ ] Generate release notes (ES + EN)
- [ ] Commit version bump
- [ ] Push to remote
- [ ] Upload to Play Console
- [ ] Submit for review
