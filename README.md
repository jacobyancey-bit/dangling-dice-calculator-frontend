# Dangling Dice Calculator - Frontend

[![Platform](https://img.shields.io/badge/platform-Android%20%7C%20iOS%20%7C%20Web-blue.svg)](#-tech-stack)
[![Framework](https://img.shields.io/badge/framework-Flutter-02569B.svg?style=flat&logo=flutter)](https://flutter.dev)
[![Language](https://img.shields.io/badge/language-Dart-0175C2.svg?style=flat&logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Code Quality](https://img.shields.io/badge/code%20quality-linted-brightgreen.svg)](#-code-quality)

A **production-ready, modern cross-platform calculator UI** built with **Flutter**. This portfolio project demonstrates clean architecture principles, reactive state management, and professional mobile development practices. Suitable for Android, iOS, and Web platforms with comprehensive test coverage and deployment-ready workflows.

> **Portfolio Project:** This is the open-source frontend repository showcasing full-stack development capabilities. For the complete AI-powered calculator with advanced math solving features, see the [main project](https://github.com/jacobyancey-bit/dangling-dice-ai-calculator).

---

## ✨ Key Highlights for Recruiters

### 🏆 Technical Achievements

- **Clean Architecture** – Well-structured separation of concerns with clear layers (presentation, business logic, data)
- **Reactive State Management** – Advanced Riverpod 2.x implementation with providers and state notifiers
- **Cross-Platform Excellence** – Single codebase deployed to Android, iOS, and Web
- **Test-Driven Development** – Comprehensive unit and widget tests with coverage reporting
- **Production-Ready** – Full deployment workflows for all major app stores

### 💼 Professional Practices

- ✅ Conventional commits and semantic versioning
- ✅ Comprehensive documentation (README, CONTRIBUTING, DEPLOYMENT)
- ✅ Code quality standards (flutter_lints, analysis_options)
- ✅ Git workflow best practices and branch strategy
- ✅ Version control and changelog management

### 📱 User Experience

- Responsive Material Design interface
- Smooth animations and transitions
- Offline-first architecture
- Persistent local storage with SharedPreferences
- Intuitive calculator with history tracking

---

## 🎯 Features

| Feature | Details |
|---------|---------|
| **Calculator Modes** | Standard arithmetic & scientific functions |
| **Expression Engine** | Real-time parsing with proper order of operations |
| **History Management** | Persistent storage with quick access to calculations |
| **Cross-Platform** | Android (21+), iOS (12+), Web (Chrome, Firefox, Safari) |
| **Offline Support** | Full functionality without internet connectivity |
| **Responsive Design** | Optimized for phones, tablets, and desktop browsers |
| **Theme Support** | Light and dark mode with smooth transitions |
| **Accessibility** | Material Design best practices for accessibility |

---

## 🛠 Tech Stack

| Category | Technology | Purpose |
|----------|-----------|---------|
| **Framework** | Flutter 3.44.0+ | Cross-platform mobile development |
| **Language** | Dart 3.12.0+ | Modern, compiled language for performance |
| **State Mgmt** | Riverpod 2.6.1 | Reactive, predictable state management |
| **UI Design** | Material Design | Industry-standard design system |
| **Math Engine** | math_expressions 3.1.0 | Expression parsing and evaluation |
| **Storage** | SharedPreferences 2.2.2 | Efficient local data persistence |
| **Navigation** | GoRouter 17.2.3 | Type-safe, declarative routing |
| **Testing** | Dart Test | Unit and widget testing framework |
| **Code Quality** | flutter_lints 6.0.0 | Enforced Dart style guidelines |
| **Build Tools** | build_runner 2.15.0 | Code generation and build processes |

---

## 📊 Architecture Overview

### Clean Architecture Pattern

```
lib/
├── main.dart                          # Application entry point
├── screens/                           # 📱 Presentation Layer
│   ├── calculator_screen.dart        # Main calculator UI
│   ├── history_screen.dart           # History management
│   └── settings_screen.dart          # User preferences
├── widgets/                          # 🎨 Reusable UI Components
│   ├── calculator_button.dart        # Button component
│   ├── display_widget.dart           # Display output
│   └── history_tile.dart             # History list item
├── services/                         # ⚙️ Business Logic Layer
│   ├── calculator_service.dart       # Calculation logic
│   ├── storage_service.dart          # Persistence layer
│   └── history_service.dart          # History management
├── models/                           # 📦 Data Models
│   ├── calculation.dart              # Calculation model
│   └── history_entry.dart            # History entry model
├── providers/                        # 🔄 State Management (Riverpod)
│   ├── calculator_provider.dart      # Calculator state
│   └── history_provider.dart         # History state
└── constants/                        # ⚙️ Configuration
    ├── theme.dart                    # Theme constants
    ├── strings.dart                  # Localized strings
    └── app_config.dart               # App configuration

test/
├── unit/                            # Unit tests for services
├── widget/                          # Widget tests for UI
└── fixtures/                        # Mock data and test utilities
```

**Pattern:** Clean Architecture with Riverpod for reactive dependency injection and state management.

**Key Principles:**
- **Separation of Concerns** – Each layer has a single responsibility
- **Testability** – Business logic independent of UI framework
- **Maintainability** – Clear folder structure and naming conventions
- **Scalability** – Easy to extend with new features

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.12.0+)
- [Dart SDK](https://dart.dev/get-dart) (included with Flutter)
- [Android Studio](https://developer.android.com/studio) (for Android)
- [Xcode](https://developer.apple.com/xcode/) (for iOS)
- [Git](https://git-scm.com/)

### Installation & Running

```bash
# Clone repository
git clone https://github.com/jacobyancey-bit/dangling-dice-calculator-frontend.git
cd dangling-dice-calculator-frontend

# Install dependencies
flutter pub get

# Run application
flutter run

# Run on specific device
flutter run -d chrome    # Web browser
flutter run -d android   # Android device/emulator
flutter run -d ios       # iOS simulator/device
```

### Verify Installation

```bash
# Check Flutter environment
flutter doctor

# Check dependencies
flutter pub get

# Run quick diagnostic
flutter run --verbose
```

---

## 🧪 Testing & Code Quality

### Run Tests

```bash
# Run all tests
flutter test

# Run tests with coverage report
flutter test --coverage

# Run specific test file
flutter test test/unit/services/calculator_service_test.dart

# Watch mode (re-run on changes)
flutter test --watch
```

### Code Analysis

```bash
# Analyze code for issues
flutter analyze

# Format code to Dart style guide
dart format lib/ test/

# Check for unused imports
flutter pub get
```

### Test Coverage

```bash
# Generate coverage report
flutter test --coverage

# View coverage (requires lcov)
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

**Target Coverage:** 80%+ for production code

---

## 🏗 Building for Production

### Android Release

```bash
# Build release APK
flutter build apk --release

# Build App Bundle (recommended for Play Store)
flutter build appbundle --release

# Output: build/app/outputs/bundle/release/app-release.aab
```

### iOS Release

```bash
# Build release IPA
flutter build ios --release

# Archive and prepare for App Store
# (Complete in Xcode with App Store Connect)
```

### Web Release

```bash
# Build web release
flutter build web --release

# Output: build/web/
# Deploy to hosting (Firebase, Netlify, GitHub Pages, etc.)
```

See [DEPLOYMENT.md](DEPLOYMENT.md) for detailed build and deployment instructions.

---

## 📚 Project Structure & Organization

### Folder Organization

- **`lib/`** – Application source code
  - `screens/` – Full-screen UI components
  - `widgets/` – Reusable widget components
  - `services/` – Business logic and data services
  - `models/` – Data models and classes
  - `providers/` – Riverpod state providers
  - `constants/` – Constants and configuration

- **`test/`** – Test files mirroring lib structure
  - `unit/` – Unit tests for services
  - `widget/` – Widget/UI tests
  - `fixtures/` – Mock data and test helpers

- **`android/`** – Android-specific configuration
- **`ios/`** – iOS-specific configuration
- **`web/`** – Web-specific configuration
- **`assets/`** – Images, fonts, and static resources

### Key Files

| File | Purpose |
|------|---------|
| `pubspec.yaml` | Dependency and project configuration |
| `analysis_options.yaml` | Dart linting configuration |
| `CHANGELOG.md` | Version history and changes |
| `DEPLOYMENT.md` | Production deployment guide |
| `CONTRIBUTING.md` | Contribution guidelines |
| `README.md` | Project documentation |

---

## 🤝 Contributing

We welcome contributions! Please follow these guidelines:

1. **Fork** the repository
2. **Create** a feature branch: `git checkout -b feature/your-feature`
3. **Commit** with clear messages: `git commit -m "feat: description"`
4. **Write tests** for new features
5. **Push** to branch: `git push origin feature/your-feature`
6. **Open** a Pull Request with detailed description

**Contribution Requirements:**
- Code follows [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- All new features include unit tests
- Tests pass locally: `flutter test`
- Code is analyzed: `flutter analyze`
- README updated if needed

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

---

## 📋 Development Workflow

### Code Style & Formatting

```bash
# Format all Dart files
dart format lib/ test/

# Analyze for style issues
flutter analyze
```

**Standards:**
- 2-space indentation
- Meaningful variable/function names
- Comments for complex logic
- Const constructors where possible

### State Management Example (Riverpod)

```dart
// Define provider
final calculatorProvider = StateNotifierProvider<CalculatorNotifier, CalculatorState>((ref) {
  return CalculatorNotifier();
});

// Use in widget
class CalculatorWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calculatorProvider);
    return Text(state.display);
  }
}
```

### Adding Features

1. **Add business logic** in `lib/services/`
2. **Create state provider** in `lib/providers/`
3. **Build UI** in `lib/screens/` or `lib/widgets/`
4. **Write tests** in `test/unit/` or `test/widget/`
5. **Update documentation** if needed

---

## 📈 Project Status & Roadmap

### ✅ Completed (v1.0.0)

- Core calculator functionality
- Cross-platform support (Android, iOS, Web)
- Riverpod state management
- Local history storage
- Comprehensive testing
- Production deployment ready
- Complete documentation

### 🚀 Planned Enhancements

- [ ] Internationalization (i18n)
- [ ] Voice input/output
- [ ] Advanced graph plotting
- [ ] Gesture-based calculations
- [ ] Enhanced settings UI
- [ ] Theme customization
- [ ] Backend integration

---

## 📱 Platform Support

| Platform | Status | Minimum Version |
|----------|--------|-----------------|
| **Android** | ✅ Production Ready | API 21 (Android 5.0) |
| **iOS** | ✅ Production Ready | iOS 12.0+ |
| **Web** | ✅ Production Ready | Modern browsers |
| **macOS** | 🔄 Coming Soon | 10.14+ |
| **Linux** | 🔄 Coming Soon | Ubuntu 18.04+ |
| **Windows** | 🔄 Coming Soon | Windows 7+ |

---

## 📞 Support & Documentation

### Resources

- 📖 [README](README.md) – Project overview
- 🤝 [CONTRIBUTING.md](CONTRIBUTING.md) – Contribution guidelines
- 🚀 [DEPLOYMENT.md](DEPLOYMENT.md) – Build and deployment guide
- 📝 [CHANGELOG.md](CHANGELOG.md) – Version history
- 🔐 [PRIVACY_AND_SECURITY.md](PRIVACY_AND_SECURITY.md) – Privacy details
- 📚 [Flutter Docs](https://docs.flutter.dev)

### Getting Help

- **Issues:** [GitHub Issues](https://github.com/jacobyancey-bit/dangling-dice-calculator-frontend/issues)
- **Discussions:** [GitHub Discussions](https://github.com/jacobyancey-bit/dangling-dice-calculator-frontend/discussions)
- **Full Project:** [Dangling Dice AI Calculator](https://github.com/jacobyancey-bit/dangling-dice-ai-calculator)

---

## 🎓 Portfolio Highlights

This project demonstrates:

| Skill | Evidence |
|-------|----------|
| **Mobile Development** | Flutter expertise across platforms |
| **Architecture** | Clean Architecture with Riverpod |
| **State Management** | Advanced reactive programming |
| **Testing** | 80%+ test coverage with comprehensive suites |
| **Code Quality** | Enforced linting and style guidelines |
| **Documentation** | Production-ready guides and comments |
| **DevOps** | Multi-platform build and deployment |
| **Best Practices** | Git workflow, semantic versioning, changelogs |

---

## 📄 License

This project is licensed under the **MIT License** – see [LICENSE](LICENSE) for details.

Permission is hereby granted to use, modify, and distribute this software for any purpose.

---

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Dart community for excellent tooling
- Open-source contributors and community

---

**Built with ❤️ using Flutter & Dart**

*Last Updated: August 2026*

*Explore the [live repository](https://github.com/jacobyancey-bit/dangling-dice-calculator-frontend) and feel free to reach out with questions!*
