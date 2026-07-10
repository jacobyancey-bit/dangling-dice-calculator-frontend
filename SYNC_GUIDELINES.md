# Repository Sync Guidelines

This document provides guidance on syncing code from the private repository to the public frontend repository while maintaining security and intellectual property protection.

## Overview

The **private repository** (`dangling-dice-ai-calculator`) contains the complete, production application with all proprietary features. The **public repository** (`dangling-dice-calculator-frontend`) contains only the UI layer and public components.

## What to Include in Public Repo

### ✅ Safe to Sync

#### UI & Presentation Layer
- `lib/screens/` - User interface screens
  - Calculator display screen
  - History screen
  - Settings screen
  - All Material Design implementations
- `lib/widgets/` - Reusable UI components
  - Calculator buttons
  - Display widgets
  - History list tiles
  - Settings widgets
- `lib/constants/` - Public constants
  - Theme colors
  - Typography settings
  - Animation durations
  - UI strings (non-sensitive)

#### Core Business Logic (Lite Version)
- `lib/services/calculation_service.dart` - Basic math calculation engine
- `lib/models/` - Data models (lite versions)
  - `calculator_state.dart`
  - `calculation_history.dart`
  - `user_settings.dart`
- `lib/providers/` - State management (public providers only)
  - `calculator_provider.dart`
  - `history_provider.dart`
  - `settings_provider.dart`

#### Testing
- `test/unit/` - Unit tests for public services
- `test/widget/` - Widget tests for UI components
- `test/fixtures/` - Test data and mocks

#### Assets
- `assets/images/` - App icons and UI graphics
- `assets/fonts/` - Font files (if open-source licensed)

#### Configuration
- `pubspec.yaml` - Public dependencies only
- `.gitignore` - Already configured
- `analysis_options.yaml` - Linting rules
- `README.md` - Public documentation

---

## What to EXCLUDE from Public Repo

### ❌ Never Sync These Files

#### AI & Machine Learning
```
lib/services/ai_service.dart
lib/services/gemini_service.dart
lib/services/google_generative_ai_service.dart
lib/providers/ai_solver.dart
lib/providers/math_solver_provider.dart
lib/models/ai_response.dart
lib/models/step_by_step_explanation.dart
```
**Reason:** Proprietary AI integration and advanced math solving logic

#### Firebase & Backend
```
lib/services/firebase_service.dart
lib/services/firebase_auth_service.dart
lib/services/cloud_functions_service.dart
lib/config/firebase_config.dart
lib/providers/firebase_provider.dart
lib/providers/auth_provider.dart
google-services.json
GoogleService-Info.plist
```
**Reason:** Backend infrastructure and server-side logic

#### Payment & Monetization
```
lib/services/payment_service.dart
lib/services/subscription_service.dart
lib/providers/purchases_provider.dart
lib/models/subscription_model.dart
android/app/build.gradle (RevenueCat config)
ios/Runner/Info.plist (RevenueCat config)
```
**Reason:** Revenue model and payment processing

#### Analytics & Tracking
```
lib/services/analytics_service.dart
lib/services/crashlytics_service.dart
lib/providers/analytics_provider.dart
```
**Reason:** Internal tracking and monitoring

#### Credentials & Secrets
```
.env
.env.prod
.env.keys
**/secrets.json
**/config.secret.dart
**/*.keystore
**/*.p12
**/*.p8
keystore-b64.txt
serviceAccountKey*.json
```
**Reason:** Never expose any credentials

#### Build Artifacts
```
build/
.dart_tool/
ios/Pods/
android/.gradle/
.pub-cache/
.packages
pubspec.lock
```
**Reason:** Generated files; not part of source code

---

## Cleanup Checklist

Before pushing to public repository, verify:

### 1. Search for API Keys & Credentials
```bash
scripts/identify-proprietary-files.sh
```

### 2. Remove Firebase Imports
Search and remove:
```dart
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
```

### 3. Remove Gemini API Integration
Search and remove:
```dart
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:google_generative_ai_service.dart';
```

### 4. Remove Payment SDK
Search and remove:
```dart
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
```

### 5. Verify pubspec.yaml
Ensure public version does NOT contain:
- `firebase_*` packages
- `google_generative_ai`
- `purchases_flutter`
- `google_mobile_ads`
- Other proprietary packages

### 6. Check for Hardcoded Credentials
Search for:
- API endpoints (internal)
- API keys
- Project IDs
- Service accounts

### 7. Test the Public Version
```bash
cd dangling-dice-calculator-frontend
flutter pub get
flutter analyze  # Check for import errors
flutter test
```

---

## Sync Workflow

### Manual Sync Process

1. **Create a sync branch** in the private repo:
   ```bash
   cd dangling-dice-ai-calculator
   git checkout -b sync/public-release
   ```

2. **Remove proprietary files:**
   ```bash
   # Delete sensitive directories
   rm -rf lib/services/ai_service.dart
   rm -rf lib/providers/ai_solver.dart
   # etc... (see EXCLUDE list above)
   ```

3. **Clean imports:**
   - Remove Firebase imports from all files
   - Remove Gemini API imports
   - Remove payment SDK imports

4. **Update pubspec.yaml:**
   - Remove proprietary dependencies
   - Run `flutter pub get` to verify

5. **Commit and push:**
   ```bash
   git add .
   git commit -m "Prepare public release - remove proprietary code"
   git push origin sync/public-release
   ```

6. **Cherry-pick to public repo:**
   ```bash
   cd dangling-dice-calculator-frontend
   git pull origin main
   # Merge cleaned code from private repo
   # Review all changes
   git push origin main
   ```

### Automated Sync Script

Use the provided sync script:
```bash
scripts/sync-from-private.sh
```

This script:
1. Clones the private repo
2. Stages specific directories
3. Prompts you to review/clean files
4. Commits and pushes to public repo

---

## File Structure Comparison

### Private Repo (Complete)
```
lib/
├── screens/           ← UI
├── widgets/           ← UI Components
├── services/          ← ALL services (including Firebase, AI, Payments)
├── providers/         ← ALL providers (including proprietary)
├── models/            ← ALL models
└── config/            ← Firebase config, API keys, etc.
```

### Public Repo (Frontend Only)
```
lib/
├── screens/           ← UI ✓
├── widgets/           ← UI Components ✓
├── services/          ← ONLY: calculation_service ✓
├── providers/         ← ONLY: public providers ✓
├── models/            ← ONLY: lite models ✓
└── config/            ← Only public constants ✓
```

---

## Troubleshooting

### Issue: "Unresolved reference" errors after sync

**Solution:** You removed a service that was being imported. Find and remove those imports.

```bash
# Find references to removed files
grep -r "firebase_service" lib/
grep -r "ai_service" lib/
```

### Issue: Pubspec conflicts

**Solution:** Use the public pubspec.yaml template. Don't sync pubspec.yaml from private repo.

```bash
# Don't overwrite public pubspec.yaml
git checkout HEAD -- pubspec.yaml
```

### Issue: Accidentally committed secrets

**Solution:** Remove from git history immediately:

```bash
# Remove file from history
git filter-branch --tree-filter 'rm -f <file>' HEAD
git push origin main --force-with-lease
```

---

## Code Examples

### ✅ Safe to Include: Public Calculator Service

```dart
// lib/services/calculation_service.dart
import 'package:math_expressions/math_expressions.dart';

class CalculationService {
  String evaluate(String expression) {
    try {
      final parser = Parser();
      final expr = parser.parse(expression);
      final evaluator = ContextModel();
      final result = expr.evaluate(EvaluationType.REAL, evaluator);
      return result.toString();
    } catch (e) {
      return 'Error';
    }
  }
}
```

### ❌ NEVER Include: Proprietary AI Service

```dart
// DO NOT INCLUDE IN PUBLIC REPO
// lib/services/ai_service.dart
import 'package:google_generative_ai/google_generative_ai.dart';

class AIService {
  late final GenerativeModel _model;
  
  AIService(String apiKey) {
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: apiKey,  // ← SECRETS!
    );
  }
  // ... proprietary logic
}
```

---

## Security Best Practices

1. **Always review before pushing** - Never automate without human verification
2. **Use diff tools** - `git diff` shows exactly what you're syncing
3. **Test thoroughly** - Run full test suite on public version
4. **Monitor for leaks** - Periodically audit public repo for secrets
5. **Document changes** - Keep a changelog of what's synced vs. excluded
6. **Separate branches** - Use a `sync/` branch prefix for organization

---

## Questions?

If you're unsure whether a file should be public:
- **Ask yourself:** "Does this expose proprietary logic or credentials?"
- **When in doubt:** Keep it private
- **Rule of thumb:** UI and generic services are OK; AI, payments, and backend are not

For more information, see:
- Private repo: `dangling-dice-ai-calculator`
- [Contributing Guidelines](CONTRIBUTING.md)
- [License](LICENSE)
