# News App Flutter 📱

> A modern Flutter application that delivers the latest news with an elegant interface, featuring dark/light themes, article search, bookmarks, and seamless browsing experience.

[![Flutter Version](https://img.shields.io/badge/flutter-v3.0.5+-blue.svg?style=flat-square)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/dart-v3.0.5+-blue.svg?style=flat-square)](https://dart.dev)
[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat-square)](https://opensource.org/licenses/MIT)
[![News API](https://img.shields.io/badge/API-NewsAPI-orange.svg?style=flat-square)](https://newsapi.org/)

A comprehensive news application built with Flutter that provides users with the latest articles from trusted sources. The app features beautiful Material Design UI, smooth animations, dark/light theme support, and powerful search functionality. It integrates with the NewsAPI to deliver real-time news content with advanced sorting and filtering options.

## ✨ Features

### Core Functionality

- 🏠 **Home Screen**: Browse latest news articles with beautiful card layouts
- 🔍 **Advanced Search**: Search for articles by keywords with real-time results
- 📑 **Top Headlines**: View trending news from reliable sources
- 🔖 **Bookmarks**: Save articles for offline reading (UI ready)
- 📖 **Article Details**: Full article view with web integration
- 🌐 **In-App WebView**: Read full articles without leaving the app

### User Experience

- 🌙 **Dark/Light Theme**: Toggle between themes with persistent preferences
- 📱 **Responsive Design**: Optimized for different screen sizes
- ⚡ **Shimmer Loading**: Beautiful loading animations
- 🎨 **Material Design**: Clean and modern UI following Material guidelines
- 🔄 **Pull to Refresh**: Refresh content with intuitive gestures
- 📄 **Pagination**: Smooth navigation through multiple pages of news

### Technical Features

- 🏗️ **Provider State Management**: Efficient state management using Provider pattern
- 🎯 **API Integration**: Real-time news data from NewsAPI
- 💾 **Local Storage**: Theme preferences with SharedPreferences
- 🔗 **URL Launching**: External link handling
- 📊 **Reading Time**: Automatic reading time calculation
- 🎪 **Card Swiper**: Interactive article browsing with smooth animations

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.5 or later)
- Dart SDK (3.0.5 or later)
- Android Studio / VS Code with Flutter extensions
- NewsAPI key (get one free at [newsapi.org](https://newsapi.org/))

### Installation

1. **Clone the repository**

   ```powershell
   git clone https://github.com/Navid-Rahman/News-App-Flutter.git
   cd News-App-Flutter
   ```

2. **Install dependencies**

   ```powershell
   flutter pub get
   ```

3. **Configure API Key**

   - Get your free API key from [NewsAPI](https://newsapi.org/)
   - Update the API key in `lib/utils/api_constants.dart`

   ```dart
   String API_KEY = 'your_api_key_here';
   ```

4. **Run the application**
   ```powershell
   flutter run
   ```

### Build for Production

**Android:**

```powershell
flutter build apk --release
```

**iOS:**

```powershell
flutter build ios --release
```

## 📱 App Architecture

### Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   └── news_model.dart      # News article model
├── provider/                 # State management
│   ├── dark_theme_provider.dart
│   └── news_provider.dart
├── screens/                  # UI screens
│   ├── home_screen.dart
│   ├── search_screen.dart
│   ├── bookmarks_screen.dart
│   ├── news_details_screen.dart
│   └── news_details_webview.dart
├── services/                 # Business logic
│   ├── news_api.dart        # API service
│   ├── dark_theme_prefs.dart
│   └── utils.dart
├── utils/                    # Constants & utilities
│   ├── api_constants.dart
│   ├── theme_data.dart
│   └── global_colors.dart
└── widgets/                  # Reusable UI components
    ├── articles_widget.dart
    ├── top_trending.dart
    ├── drawer_widgets.dart
    └── loading_widget.dart
```

### Tech Stack

- **Framework**: Flutter 3.0.5+
- **Language**: Dart 3.0.5+
- **State Management**: Provider
- **HTTP Client**: http package
- **Local Storage**: SharedPreferences
- **UI Components**: Material Design
- **Navigation**: Named routes
- **API**: NewsAPI.org

## 🛠️ Key Dependencies

| Package                | Purpose                  | Version  |
| ---------------------- | ------------------------ | -------- |
| `provider`             | State management         | ^6.1.2   |
| `http`                 | HTTP requests            | ^1.1.0   |
| `shared_preferences`   | Local storage            | ^2.2.3   |
| `google_fonts`         | Custom fonts             | ^5.1.0   |
| `card_swiper`          | Card animations          | ^2.0.4   |
| `flutter_inappwebview` | Web view                 | ^5.7.2+3 |
| `shimmer`              | Loading animations       | ^3.0.0   |
| `url_launcher`         | External URLs            | ^6.1.12  |
| `reading_time`         | Reading time calculation | ^2.0.0   |
| `intl`                 | Date formatting          | ^0.18.1  |

## 💡 Usage Guide

### Navigation

- **Home Screen**: Swipe through trending articles using the card swiper
- **Search**: Tap the search icon to find specific articles
- **Sorting**: Use the dropdown to sort by relevancy, date, or popularity
- **Theme Toggle**: Switch between dark and light themes via the drawer
- **Article View**: Tap any article to read the full content

### Features Walkthrough

1. **Browse News**: The home screen displays the latest articles with beautiful card layouts
2. **Search Articles**: Use the search functionality to find articles by keywords
3. **Read Full Articles**: Tap on any article to view details and read the full content
4. **Theme Customization**: Toggle between dark and light themes for comfortable reading
5. **Bookmark Articles**: Save interesting articles for later reading (bookmark functionality UI is ready)

## 📸 Screenshots

### Light Theme

|                                                      Home Screen                                                      |                                                      Search Screen                                                      |                                                         Article Details                                                          |
| :-------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------------------: |
| ![Home Screen](https://github.com/Navid-Rahman/News-App-Flutter/assets/77515075/9fe67ae5-9599-46e4-85c4-99a7744ed7e9) | ![Search Screen](https://github.com/Navid-Rahman/News-App-Flutter/assets/77515075/604647f9-2cfa-4c84-b6d5-26e51190ef4f) | ![Article Details Screen](https://github.com/Navid-Rahman/News-App-Flutter/assets/77515075/a88729e6-9e45-4f98-96fb-5f60c4d4466f) |

### Dark Theme & Additional Features

|                                                      Bookmarks Screen                                                      |                                                         Top Trending                                                          |                                                      App Drawer                                                      |
| :------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------: |
| ![Bookmarks Screen](https://github.com/Navid-Rahman/News-App-Flutter/assets/77515075/6dac31cf-300d-40e5-a1dc-80253ec28e45) | ![Top Trending Screen](https://github.com/Navid-Rahman/News-App-Flutter/assets/77515075/ff897203-9401-4b7c-b21e-191e2591081a) | ![App Drawer](https://github.com/Navid-Rahman/News-App-Flutter/assets/77515075/99f1db5c-f6f7-45bb-8258-3ff4dd599742) |

## 🎯 API Integration

This app uses the [NewsAPI](https://newsapi.org/) to fetch real-time news data. The API provides:

- **Everything Endpoint**: Search through articles from various sources
- **Top Headlines**: Get breaking news headlines
- **Sources**: Access to 80,000+ articles from 150+ sources
- **Filtering**: Sort by relevancy, popularity, or publication date
- **Pagination**: Handle large datasets efficiently

### API Configuration

The app is configured to fetch news from TechCrunch with Bitcoin-related content as a default example. You can customize this in `lib/services/news_api.dart`:

```dart
var uri = Uri.https(
  BASEURL,
  "v2/everything",
  {
    "q": "bitcoin",              // Search query
    "pageSize": "4",             // Articles per page
    "domains": "techcrunch.com", // Source domain
    "page": page.toString(),     // Page number
    "sortBy": sortBy             // Sort criteria
  },
);
```

## 🔧 Development Setup

### Environment Setup

1. **Install Flutter**: Follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install)
2. **IDE Setup**: Configure your preferred IDE (VS Code or Android Studio)
3. **Device Setup**: Connect a physical device or set up an emulator

### Running the App

```powershell
# Check Flutter installation
flutter doctor

# Get dependencies
flutter pub get

# Run on connected device
flutter run

# Run with hot reload (debug mode)
flutter run --debug

# Run in release mode
flutter run --release
```

### Code Quality

```powershell
# Analyze code
flutter analyze

# Run tests
flutter test

# Format code
flutter format .
```

## 🚀 Future Enhancements

- [ ] **Offline Reading**: Cache articles for offline access
- [ ] **Push Notifications**: Real-time news alerts
- [ ] **Social Sharing**: Share articles on social media platforms
- [ ] **Categories**: Browse news by specific categories
- [ ] **User Profiles**: Personalized news recommendations
- [ ] **Audio Playback**: Text-to-speech for articles
- [ ] **Multiple Languages**: Support for international news
- [ ] **Bookmark Functionality**: Complete bookmark save/retrieve implementation

## 📋 Release History

### Version 1.0.0 (Current)

- ✅ Initial release with core news browsing functionality
- ✅ Search and filtering capabilities
- ✅ Dark/Light theme support
- ✅ Material Design UI
- ✅ Provider state management
- ✅ NewsAPI integration
- ✅ In-app web view for articles
- ✅ Responsive design for various screen sizes

## 🤝 Contributing

We welcome contributions! Here's how you can help:

### Getting Started

1. **Fork** the repository
2. **Clone** your fork locally
3. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
4. **Make** your changes
5. **Test** your changes thoroughly
6. **Commit** your changes (`git commit -m 'Add amazing feature'`)
7. **Push** to the branch (`git push origin feature/amazing-feature`)
8. **Open** a Pull Request

### Contribution Guidelines

- Follow Flutter/Dart coding conventions
- Write clear, concise commit messages
- Add tests for new features
- Update documentation as needed
- Ensure your code passes `flutter analyze`

### Issues

- 🐛 **Bug Reports**: Use the bug report template
- 💡 **Feature Requests**: Use the feature request template
- ❓ **Questions**: Use the discussion section

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2025 Navid Rahman

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```

## 👨‍💻 Author

**Navid Rahman**

- GitHub: [@Navid-Rahman](https://github.com/Navid-Rahman)
- Email: [navid.rahman.dev@gmail.com](mailto:navid.rahman.dev@gmail.com)
- LinkedIn: [Navid Rahman](https://linkedin.com/in/navid-rahman)

## 🙏 Acknowledgments

- [Flutter Team](https://flutter.dev/) for the amazing framework
- [NewsAPI](https://newsapi.org/) for providing reliable news data
- [Material Design](https://material.io/) for design guidelines
- [Provider Package](https://pub.dev/packages/provider) for state management
- All contributors and the Flutter community

## 📞 Support

If you found this project helpful, please give it a ⭐️!

For support, email navid.rahman.dev@gmail.com or create an issue in this repository.

---

<div align="center">
  Made with ❤️ using Flutter
</div>
