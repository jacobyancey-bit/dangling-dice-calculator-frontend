# Deployment Guide - Dangling Dice Calculator Frontend

This guide covers building and deploying the Dangling Dice Calculator to production on Android, iOS, and Web platforms.

---

## 📋 Prerequisites

### System Requirements

- Flutter SDK 3.12.0 or higher
- Dart SDK (bundled with Flutter)
- 4GB+ free disk space
- Command-line tools installed

### Platform-Specific Requirements

#### Android
- Android SDK API Level 21+
- Android Studio or Android Command Line Tools
- A signing certificate and keystore file

#### iOS
- Xcode 14.0 or higher
- CocoaPods
- iOS Deployment Target: 12.0+
- An Apple Developer account (for distribution)

#### Web
- Modern browser (Chrome, Firefox, Safari)
- Web build support enabled in Flutter

---

## 🔐 Environment Configuration

### 1. Create Environment File

Create a `.env` file in the project root for sensitive configuration:

```bash
cp .env.example .env
```

Edit `.env` with your configuration values:

```env
# API Configuration
API_BASE_URL=https://your-api-endpoint.com
API_TIMEOUT=30000

# Analytics (optional)
ANALYTICS_ENABLED=true
ANALYTICS_KEY=your_analytics_key

# Firebase (optional)
FIREBASE_PROJECT_ID=your_project_id
FIREBASE_API_KEY=your_api_key
```

**Security Note:** Never commit `.env` file with sensitive data. It's in `.gitignore`.

---

## 🏗 Building for Android

### Generate Signing Key

If you don't have a signing key, create one:

```bash
keytool -genkey -v -keystore ~/my-release-key.keystore \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias my-key-alias
```

### Configure Signing (Android)

Create `android/key.properties`:

```properties
storeFile=~/my-release-key.keystore
storePassword=your_store_password
keyPassword=your_key_password
keyAlias=my-key-alias
```

### Build Release APK

```bash
flutter build apk --release
```

**Output Location:** `build/app/outputs/flutter-apk/app-release.apk`

### Build App Bundle (Recommended for Play Store)

```bash
flutter build appbundle --release
```

**Output Location:** `build/app/outputs/bundle/release/app-release.aab`

### Testing APK

```bash
flutter build apk --debug
adb install build/app/outputs/flutter-apk/app-debug.apk
```

---

## 🍎 Building for iOS

### Configure Signing

```bash
cd ios
pod install
cd ..
```

### Build Release IPA

```bash
flutter build ios --release
```

**Output Location:** `build/ios/iphoneos/Runner.app`

### Create IPA from Xcode

```bash
flutter build ios --release
```

Then in Xcode:
1. Open `ios/Runner.xcworkspace`
2. Select Generic iOS Device as target
3. Product → Archive
4. Distribute App → TestFlight or App Store

### Code Signing Setup

In Xcode Runner project:
1. Select Runner → Signing & Capabilities
2. Set Team ID to your Apple Developer Team
3. Set Bundle Identifier
4. Ensure provisioning profile is selected

---

## 🌐 Building for Web

### Build Web Release

```bash
flutter build web --release
```

**Output Location:** `build/web/`

### Environment Configuration for Web

Create `web/.env.json`:

```json
{
  "apiBaseUrl": "https://your-api-endpoint.com",
  "analyticsEnabled": true,
  "environment": "production"
}
```

### Web Server Deployment

#### Option 1: Firebase Hosting

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Initialize Firebase project
firebase init hosting

# Deploy
firebase deploy
```

#### Option 2: Netlify

```bash
# Install Netlify CLI
npm install -g netlify-cli

# Deploy
netlify deploy --prod --dir=build/web
```

#### Option 3: GitHub Pages

```bash
# Build with base href
flutter build web --base-href /dangling-dice-calculator-frontend/

# Deploy to gh-pages branch
gh-pages -d build/web
```

---

## 📲 Publishing to App Stores

### Google Play Store

1. **Create Google Play Developer Account**
   - Visit [Google Play Console](https://play.google.com/console)
   - Complete developer setup

2. **Create Application Entry**
   - Create new app in Play Console
   - Fill in store listing information
   - Add screenshots, description, privacy policy

3. **Upload Build**
   ```bash
   # Build AAB
   flutter build appbundle --release
   ```
   - Upload AAB to Google Play Console
   - Complete content rating questionnaire
   - Submit for review

4. **Pre-Launch Checklist**
   - ✅ Compile version updated
   - ✅ Permissions justified
   - ✅ Target API level current
   - ✅ Screenshots prepared
   - ✅ Privacy policy link included
   - ✅ Content rating completed

### Apple App Store

1. **Create Apple Developer Account**
   - Visit [Apple Developer Program](https://developer.apple.com/programs/)
   - Complete enrollment

2. **Create App Record**
   - Log in to [App Store Connect](https://appstoreconnect.apple.com)
   - Create new app
   - Fill in app information

3. **Build and Submit**
   ```bash
   flutter build ios --release
   ```
   - Archive in Xcode
   - Upload to App Store Connect
   - Submit for review

4. **Pre-Launch Checklist**
   - ✅ Build number incremented
   - ✅ Version number updated
   - ✅ Screenshots prepared (all device sizes)
   - ✅ App preview video (optional)
   - ✅ Privacy policy URL included
   - ✅ Category selected
   - ✅ Keywords optimized

---

## 🔍 Testing Before Deployment

### Pre-Deployment Checks

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Analyze code
flutter analyze

# Format code
dart format lib/

# Check for unused imports
flutter pub pub get
```

### Device Testing

```bash
# Test on physical Android device
flutter run --release

# Test on physical iOS device
flutter run --release

# Test on web
flutter run -d chrome --web-port=8080
```

### Performance Testing

```bash
# Build APK with profiling
flutter build apk --profile

# Use DevTools for profiling
flutter pub global activate devtools
flutter devtools
```

---

## 📊 Version Management

### Update Version

Edit `pubspec.yaml`:

```yaml
version: 1.1.0+2
```

- Format: `major.minor.patch+buildNumber`
- Increment for each release:
  - **Major**: Breaking changes
  - **Minor**: New features
  - **Patch**: Bug fixes
  - **Build**: Internal build number

### Update Build Numbers for Platforms

**Android** (`android/app/build.gradle`):
```gradle
def flutterVersionCode = flutter.versionCode
```

**iOS** (`ios/Runner.xcodeproj/project.pbxproj`):
- Update in Xcode target build settings

---

## 🚀 Continuous Deployment

### GitHub Actions Example

Create `.github/workflows/deploy.yml`:

```yaml
name: Build and Deploy

on:
  push:
    branches: [main]
    tags: ['v*']

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.44.0'
      
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test
      
      - name: Build APK
        run: flutter build apk --release
      
      - name: Upload to Play Store
        run: |
          # Add Play Store deployment script
```

---

## 🐛 Troubleshooting

### Common Issues

**Issue:** "Gradle sync failed"
```bash
# Solution: Clean and rebuild
cd android
./gradlew clean
cd ..
flutter pub get
flutter build apk --release
```

**Issue:** "Pod install failed" (iOS)
```bash
# Solution: Update CocoaPods
cd ios
rm -rf Pods Pod.lock
pod install
cd ..
```

**Issue:** "Code signing error"
```bash
# Solution: Clear build cache
flutter clean
flutter pub get
flutter build ios --release
```

**Issue:** "Out of memory during build"
```bash
# Solution: Increase heap size
export GRADLE_OPTS="-Xmx4096m"
flutter build apk --release
```

---

## 📈 Post-Deployment

### Monitor Performance

- **Android:** Use [Google Play Console](https://play.google.com/console) metrics
- **iOS:** Use [App Store Connect](https://appstoreconnect.apple.com) analytics
- **Web:** Use Google Analytics or similar

### Collect Crash Reports

- Android: Enable Crashlytics in Firebase Console
- iOS: Enable crash reports in App Store Connect
- Web: Use error tracking service (Sentry, Rollbar, etc.)

### Gather User Feedback

- In-app feedback forms
- App store reviews
- GitHub Issues for bug reports

---

## 🔄 Update Checklist

Before each release:

- [ ] Increment version in `pubspec.yaml`
- [ ] Update `CHANGELOG.md`
- [ ] Review and test all changes
- [ ] Run full test suite: `flutter test`
- [ ] Run code analysis: `flutter analyze`
- [ ] Build release APK/AAB: `flutter build appbundle --release`
- [ ] Build release iOS: `flutter build ios --release`
- [ ] Test on physical devices
- [ ] Update Google Play/App Store metadata
- [ ] Submit for review
- [ ] Create Git tag: `git tag -a v1.1.0 -m "Release v1.1.0"`

---

## 📞 Support

For deployment issues or questions:
- Check [Flutter Documentation](https://docs.flutter.dev)
- Review [Android Documentation](https://developer.android.com)
- Review [iOS Documentation](https://developer.apple.com/documentation)
- Open an issue on [GitHub Issues](https://github.com/jacobyancey-bit/dangling-dice-calculator-frontend/issues)

---

**Last Updated:** 2026
