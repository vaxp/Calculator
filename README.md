# Calculator — Official Calculator for VAXP-OS 🔢

An official, lightweight calculator application developed for the VAXP-OS distribution. Calculator provides fast, easy-to-use arithmetic functionality in a compact interface and follows the VAXP-OS visual style.

Built with Flutter and following a Clean Architecture approach to ensure high performance, maintainability, and reliable handling of arithmetic operations.

## Key features

- Native integration with VAXP-OS visual style (dark theme with accent colors for operator buttons)
- Clean Architecture and GetX for state management to provide snappy, predictable UI updates
- Basic arithmetic operations: addition, subtraction, multiplication, division
- Focused, minimal UI designed for ease of use
- Standard control buttons such as AC (all clear), +/- (toggle sign), and % (percentage)

## Screenshots

Main calculator screen 

## Installation & Building

This project is open source and available at: https://github.com/vaxp/Calculator.git

On VAXP-OS the application ships preinstalled as a core utility and does not require any user installation.

If you want to build from source (for developers):

Prerequisites

- Flutter SDK installed and configured for your platform

Clone the repository

```bash
git clone https://github.com/vaxp/Calculator.git
cd Calculator
```

Get dependencies

```bash
flutter pub get
```

Build for Linux

```bash
flutter build linux
```

Follow your distribution packaging or installation steps (for example, copying the built bundle to /opt or creating a .deb package) to install the app system-wide.

## License

This project is licensed under the GNU GPLv3.
