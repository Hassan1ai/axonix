# Axonix - Smart Digital Memory App

A Flutter mobile application for intelligent memory management with AI-powered features.

## 📱 Features

- **Authentication System**: Complete signup and login flows
- **Device Pairing**: Connect to Axonix smart devices
- **Timeline View**: Browse and manage recorded memories
- **Memory Details**: View detailed information about each memory event
- **AI Chat Assistant**: Interactive AI companion for memory queries
- **Settings Management**: Comprehensive settings with multiple tabs
  - Profile & Account Management
  - Device Configuration & Status
  - Recording Settings (Audio/Video)
  - AI Data Management
  - Notification Preferences
  - App Customization (Theme, Language, Backup)

## 🎨 Design Highlights

- **Dark Theme**: Modern dark UI with cyan (#00D9FF) primary color
- **Consistent Styling**: Reusable components throughout
- **High Fidelity**: Matches provided design screenshots exactly
- **Smooth Navigation**: Named routes with proper transitions

## 📁 Project Structure

```
lib/
├── config/
│   └── theme.dart                 # App theme configuration
├── screens/
│   ├── splash_screen.dart         # Animated splash screen
│   ├── signup_screen.dart         # User registration
│   ├── login_screen.dart          # User authentication
│   ├── device_pairing_screen.dart # Device connection
│   ├── timeline_screen.dart       # Memory timeline view
│   ├── memory_detail_screen.dart  # Memory details
│   ├── chat_screen.dart           # AI assistant chat
│   ├── settings_screen.dart       # Settings with tabs
│   └── settings_tabs/             # Settings tab components
│       ├── profile_tab.dart
│       ├── device_tab.dart
│       ├── record_tab.dart
│       ├── ai_data_tab.dart
│       ├── notify_tab.dart
│       └── app_tab.dart
├── widgets/
│   ├── custom_button.dart         # Reusable button widget
│   ├── custom_input_field.dart    # Text input field
│   ├── memory_card.dart           # Memory timeline card
│   ├── device_list_item.dart      # Device list item
│   └── settings_menu_item.dart    # Settings menu item
└── main.dart                      # App entry point & routing
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.9.2 or higher)
- Dart SDK
- Android Studio / Xcode for emulators
- VS Code or Android Studio with Flutter plugins

### Installation

1. **Clone the repository**
   ```bash
   cd d:/axonixx/axonix1
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Running on Specific Devices

```bash
# Run on Android emulator
flutter run -d android

# Run on iOS simulator (Mac only)
flutter run -d ios

# Run on Chrome (web)
flutter run -d chrome

# List all available devices
flutter devices
```

## 🎯 Navigation Flow

1. **Splash Screen** (/) 
   → Auto-navigates to Signup after 3 seconds

2. **Signup Screen** (/signup)
   → Create account → Device Pairing

3. **Login Screen** (/login)
   → Login → Timeline

4. **Device Pairing** (/device-pairing)
   → Connect device or skip → Timeline

5. **Timeline** (/timeline)
   → Main app hub with bottom navigation
   - Timeline tab (memories)
   - Chat AI tab
   - Settings tab

6. **Memory Detail** (/memory-detail)
   → View memory details, edit, or delete

7. **Chat Screen** (/chat)
   → AI assistant for memory queries

8. **Settings** (/settings)
   → 6 tabs with comprehensive settings

## 🎨 Theme Colors

```dart
Primary Cyan:      #00D9FF
Dark Background:   #0A0E1A
Card Background:   #151B2E
Input Background:  #0F1525
Accent Purple:     #6B4B9E
Accent Teal:       #1A6B7A
Accent Green:      #00C853
Text Primary:      #FFFFFF
Text Secondary:    #8B95B0
Border Primary:    #1E2741
```

## 📦 Dependencies

- `flutter` - Flutter SDK
- `cupertino_icons` - iOS-style icons

No external packages required! Uses only Flutter's built-in capabilities.

## 🖼️ Assets

Place your assets in the following directories:

- `assets/images/` - Images (logo, profile pictures, etc.)
- `assets/icons/` - Custom icons (optional)

The app uses Material Icons for most UI elements.

### Required Assets

- `assets/images/axonix_logo.png` - App logo (optional, shows text fallback)

## 🛠️ Development

### Adding New Screens

1. Create screen file in `lib/screens/`
2. Import in `lib/main.dart`
3. Add route in `routes` map
4. Navigate using `Navigator.pushNamed(context, '/route-name')`

### Adding Reusable Widgets

1. Create widget file in `lib/widgets/`
2. Import where needed
3. Use with consistent styling from `AppTheme`

### Modifying Theme

Edit `lib/config/theme.dart` to change colors, fonts, or styles globally.

## 📱 Screen Overview

| Screen | Route | Description |
|--------|-------|-------------|
| Splash | `/` | Animated logo with floating circles |
| Signup | `/signup` | User registration with name, email, password |
| Login | `/login` | User authentication |
| Device Pairing | `/device-pairing` | Connect to Axonix devices |
| Timeline | `/timeline` | Memory feed with cards |
| Memory Detail | `/memory-detail` | Full memory view with edit/delete |
| Chat | `/chat` | AI assistant conversation |
| Settings | `/settings` | 6-tab settings interface |

## 🔧 Troubleshooting

### Common Issues

1. **"MyApp class not found" error in tests**
   - This is expected after replacing boilerplate code
   - Update `test/widget_test.dart` to use `AxonixApp` instead

2. **Assets not loading**
   - Ensure `flutter pub get` was run after updating pubspec.yaml
   - Check asset paths in pubspec.yaml
   - Hot restart (not hot reload) after adding assets

3. **Navigation errors**
   - Ensure all routes are defined in main.dart
   - Use named routes consistently

## 📝 Code Quality

- ✅ Const constructors where possible
- ✅ Clean widget hierarchies
- ✅ Proper separation of concerns
- ✅ Reusable components
- ✅ Consistent naming conventions
- ✅ No hardcoded values (uses theme)

## 🎯 Next Steps

1. **Add State Management**: Consider Provider, Riverpod, or Bloc for app state
2. **Backend Integration**: Connect to API for data persistence
3. **Authentication**: Implement real authentication flow
4. **Device SDK**: Integrate with actual Axonix hardware
5. **Local Storage**: Add shared_preferences or Hive for local data
6. **Testing**: Write unit and widget tests
7. **CI/CD**: Set up automated builds and testing

## 📄 License

This is a design implementation project for Axonix.

## 🤝 Contributing

This project was generated from design screenshots to demonstrate Flutter UI development capabilities.

---

**Built with Flutter 💙**
