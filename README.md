# 📱 SDfMP – Software Development for Mobile Platforms

A collection of cross-platform mobile applications and labs for mastering software development on Android & iOS, primarily using Flutter and Dart.

## 📂 Structure

- `Lab1/` – 📝 **Notes App**
  - Simple and colorful note-taking app.
  - Search, list view, color labels, Android/iOS support.
  - Built with Flutter, state management (Cubit), and Drift for local storage.
- `Lab2/` – 📰 **News Reader App**
  - Reads RSS feeds and displays news in a web view.
  - Android/iOS support, custom RSS URLs, simple interface.
  - Built with Flutter.
- `Lab3/` – 🔳 **QR-code App**
  - Generates QR codes from custom text.
  - Decodes QR codes to text and copies to clipboard.
  - Android/iOS support, Flutter + qr_flutter.

## ✨ Features

- All apps are cross-platform: Android & iOS
- Clean, simple UIs with modern Flutter features
- Local data storage, QR/Barcode, RSS, and more

## 🚀 Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/SgXXG/SDfMP.git
   cd SDfMP/Lab1   # or Lab2, Lab3
   ```
2. **Install dependencies**
   ```bash
   flutter pub get
   ```
3. **Run the app**
   ```bash
   flutter run
   ```
   > Make sure you have a device/emulator running.

## 🔍 Labs Overview

### Lab 1: Notes App
- Add, delete, update, search notes
- Assign color labels
- To-do: App lock, archive, cloud backup

### Lab 2: News Reader
- Add custom RSS feed URLs
- Read news in web view
- To-do: App lock, customization

### Lab 3: QR-code App
- Generate QR codes from text
- Decode QR codes to text (copy to clipboard)

## 🛠️ Technologies

- Flutter & Dart
- Drift (Lab1)
- qr_flutter, flutter_barcode_scanner (Lab3)
- HTTP & XML (Lab2)
- Provider, Bloc/Cubit for state management

## 👤 Author

[SgXXG](https://github.com/SgXXG)
