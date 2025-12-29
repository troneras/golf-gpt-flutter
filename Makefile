# TalkCaddy Flutter Makefile
# Load environment variables from .env file if it exists
ifneq (,$(wildcard ./.env))
    include .env
    export
endif

# Default values (override in .env file)
BACKEND_URL ?= http://localhost:8888
GOOGLE_SERVER_CLIENT_ID ?=
SENTRY_DSN ?=
SENTRY_AUTH_TOKEN ?=
MIXPANEL_TOKEN ?=
GPT_ID ?=

# Build dart-define flags (dev mode)
DART_DEFINES = --dart-define=BACKEND_URL=$(BACKEND_URL)
ifneq ($(GOOGLE_SERVER_CLIENT_ID),)
    DART_DEFINES += --dart-define=GOOGLE_SERVER_CLIENT_ID=$(GOOGLE_SERVER_CLIENT_ID)
endif
ifneq ($(MIXPANEL_TOKEN),)
    DART_DEFINES += --dart-define=MIXPANEL_TOKEN=$(MIXPANEL_TOKEN)
endif
ifneq ($(GPT_ID),)
    DART_DEFINES += --dart-define=GPT_ID=$(GPT_ID)
endif

# Build dart-define flags (prod mode - includes Sentry)
DART_DEFINES_PROD = $(DART_DEFINES) --dart-define=ENV=prod
ifneq ($(SENTRY_DSN),)
    DART_DEFINES_PROD += --dart-define=SENTRY_DSN=$(SENTRY_DSN)
endif

.PHONY: help run run-release run-prod build-apk build-ios build-apk-prod build-appbundle-prod build-ios-prod build-ipa-prod clean test analyze gen gen-watch icons splash

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

# ==================== Development ====================

run: ## Run app in debug mode (Android by default)
	flutter run $(DART_DEFINES)

run-android: ## Run app on Android device/emulator
	flutter run $(DART_DEFINES) -d android

run-ios: ## Run app on iOS device/simulator
	flutter run $(DART_DEFINES) -d ios

run-release: ## Run app in release mode
	flutter run --release $(DART_DEFINES)

run-profile: ## Run app in profile mode (for performance testing)
	flutter run --profile $(DART_DEFINES)

# ==================== Build ====================

build-apk: ## Build Android APK (release)
	flutter build apk --release $(DART_DEFINES)

build-appbundle: ## Build Android App Bundle (for Play Store)
	flutter build appbundle --release $(DART_DEFINES)

build-ios: ## Build iOS app (release)
	flutter build ios --release $(DART_DEFINES)

build-ipa: ## Build iOS IPA (for App Store)
	flutter build ipa --release $(DART_DEFINES)

# ==================== Production Builds (with Sentry) ====================

run-prod: ## Run app in production mode (with Sentry enabled)
	flutter run $(DART_DEFINES_PROD)

build-apk-prod: ## Build Android APK for production (with Sentry)
	flutter build apk --release $(DART_DEFINES_PROD)
	@if [ -n "$(SENTRY_AUTH_TOKEN)" ]; then \
		echo "Uploading debug symbols to Sentry..."; \
		SENTRY_AUTH_TOKEN=$(SENTRY_AUTH_TOKEN) dart run sentry_dart_plugin; \
	fi

build-appbundle-prod: ## Build Android App Bundle for production (with Sentry)
	flutter build appbundle --release $(DART_DEFINES_PROD)
	@if [ -n "$(SENTRY_AUTH_TOKEN)" ]; then \
		echo "Uploading debug symbols to Sentry..."; \
		SENTRY_AUTH_TOKEN=$(SENTRY_AUTH_TOKEN) dart run sentry_dart_plugin; \
	fi

build-ios-prod: ## Build iOS app for production (with Sentry)
	flutter build ios --release $(DART_DEFINES_PROD)
	@if [ -n "$(SENTRY_AUTH_TOKEN)" ]; then \
		echo "Uploading debug symbols to Sentry..."; \
		SENTRY_AUTH_TOKEN=$(SENTRY_AUTH_TOKEN) dart run sentry_dart_plugin; \
	fi

build-ipa-prod: ## Build iOS IPA for production (with Sentry)
	flutter build ipa --release $(DART_DEFINES_PROD)
	@if [ -n "$(SENTRY_AUTH_TOKEN)" ]; then \
		echo "Uploading debug symbols to Sentry..."; \
		SENTRY_AUTH_TOKEN=$(SENTRY_AUTH_TOKEN) dart run sentry_dart_plugin; \
	fi

# ==================== Code Generation ====================

gen: ## Run build_runner (freezed, riverpod, json_serializable)
	flutter pub run build_runner build --delete-conflicting-outputs

gen-watch: ## Watch and regenerate on file changes
	flutter pub run build_runner watch --delete-conflicting-outputs

i18n: ## Regenerate translations (Slang)
	flutter pub run slang

# ==================== Assets ====================

icons: ## Generate launcher icons
	flutter pub run flutter_launcher_icons

splash: ## Generate splash screen
	flutter pub run flutter_native_splash:create

# ==================== Quality ====================

test: ## Run all tests
	flutter test

test-coverage: ## Run tests with coverage report
	flutter test --coverage

analyze: ## Run Flutter analyzer
	flutter analyze

format: ## Format Dart code
	dart format lib test

lint: ## Run analyzer and format check
	flutter analyze && dart format --set-exit-if-changed lib test

# ==================== Utilities ====================

clean: ## Clean build artifacts
	flutter clean && flutter pub get

deps: ## Get dependencies
	flutter pub get

upgrade: ## Upgrade dependencies
	flutter pub upgrade

outdated: ## Check for outdated dependencies
	flutter pub outdated

# ==================== Setup ====================

setup: ## Initial project setup (deps + gen + icons + splash)
	flutter pub get
	flutter pub run build_runner build --delete-conflicting-outputs
	flutter pub run slang
	@echo "Setup complete! Copy .env.example to .env and configure your values."
