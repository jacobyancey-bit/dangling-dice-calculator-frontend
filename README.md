# Dangling Dice Calculator - Frontend

[![Platform](https://img.shields.io/badge/platform-Android%20%7C%20iOS-blue.svg)](#-tech-stack)
[![Framework](https://img.shields.io/badge/framework-Flutter-02569B.svg?style=flat&logo=flutter)](https://flutter.dev)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

A modern, responsive calculator UI built with Flutter. This repository contains the user interface and frontend components of the Dangling Dice Calculator application. It demonstrates clean architecture principles, state management with Riverpod, and a polished mobile-first design.

> **Note:** This is the open-source frontend repository. For the complete AI-powered calculator with advanced math solving features, see the [main project](https://github.com/jacobyancey-bit/dangling-dice-ai-calculator).

---

## 🎯 Features

* **Standard & Scientific Calculator:** Fast, responsive UI for arithmetic and algebraic functions
* **Clean, Intuitive Interface:** Material Design with smooth animations
* **Cross-Platform:** Works seamlessly on Android and iOS
* **Offline Mode:** Full calculator functionality without an internet connection
* **History Tracking:** View and manage calculation history
* **Responsive Design:** Optimized for phones and tablets

---

## 🛠 Tech Stack

* **Frontend Framework:** Flutter / Dart (Cross-platform)
* **State Management:** Riverpod (Predictable, reactive state management)
* **UI Components:** Material Design + Cupertino icons
* **Math Engine:** math_expressions (For expression parsing and evaluation)
* **Local Storage:** Shared Preferences (For history and user preferences)
* **Navigation:** Go Router (Type-safe routing)
* **Testing:** Dart Test framework

---

## 📦 Installation & Setup

### Prerequisites

* [Flutter SDK](https://docs.flutter.dev/get-started/install) (Latest stable version - 3.12.0+)
* [Android Studio](https://developer.android.com/studio) (for Android development)
* [Xcode](https://developer.apple.com/xcode/) (for iOS development)

### Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/jacobyancey-bit/dangling-dice-calculator-frontend.git
   cd dangling-dice-calculator-frontend

Install dependencies:
bash
flutter pub get

Run the application:
bash
flutter run

Or for a specific device:
bash
flutter run -d <device_id>
flutter run -d chrome   # For web testing

🧪 Running Tests

Execute the test suite to verify functionality:
bash
flutter test

Run tests with coverage:
bash
flutter test --coverage
