# Clear Weather

![Flutter](https://img.shields.io/badge/Flutter-3.35.1-02569B?style=for-the-badge&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart)
![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-Android-green?style=for-the-badge&logo=android)

A clean, minimalist weather app built with Flutter. Get accurate hourly and daily forecasts, location-based updates, and a beautiful, modern UI.

## Features

- **Current Weather**: See real-time weather conditions for your location
- **Hourly & Daily Forecasts**: Detailed forecasts for the next hours and days
- **Location-Based Updates**: Weather data updates automatically based on your location
- **Offline Caching**: Access recent weather data even without internet
- **Dark/Light Theme**: Switch between dark and light modes
- **Settings**: Customize your experience
- **Material Design 3**: Modern, clean UI following Material Design principles
 - **Theme Switching**: Instantly toggle between dark and light modes from the settings screen
 - **Responsive Design**: Looks great on all screen sizes and devices

## Screenshots


<p align="center">
	<img src="screenshots/01-dark-mode.png" width="250" alt="Main page in dark mode (shows current, hourly, and daily weather)" />
	<img src="screenshots/02-light-mode.png" width="250" alt="Main page in light mode (shows current, hourly, and daily weather)" />
	<img src="screenshots/03-settings.png" width="250" alt="Settings screen" />
</p>

## Tech Stack

- **Framework**: Flutter 3.35.1
- **State Management**: Riverpod
- **Networking**: Dio
- **Location**: Geolocator
- **UI**: Material Design 3
- **Architecture**: Clean, modular structure with providers and services

## Getting Started

### Prerequisites
- Flutter SDK (3.35.1 or higher)
- Dart SDK
- Android Studio / VS Code

### Installation

1. **Clone the repository**
	```bash
	git clone <your-repo-url>
	cd clear_weather
	```

2. **Install dependencies**
	```bash
	flutter pub get
	```

3. **Run the app**
	```bash
	flutter run
	```

## Building for Release

### Android APK
```bash
flutter build apk --release
```

### Android App Bundle (for Play Store)
```bash
flutter build appbundle --release
```

## Project Structure

```
lib/
├── constants/        # Color schemes and constants
├── data/             # Services, repositories, exceptions
├── models/           # Data models
├── pages/            # UI screens
├── providers/        # State management
├── theme/            # App-wide theme configuration
├── utils/            # Utility functions
└── widgets/          # Reusable UI components
```

## Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Built with Flutter
- Weather data powered by Open-Meteo
- Icons from Material Design
- Inspired by clean, minimalist design principles

---

**Made by Stevie**
