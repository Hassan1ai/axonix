# 🚀 Axonix Quick Start Guide

## Run the App in 3 Steps

### 1️⃣ Get Dependencies
```bash
flutter pub get
```

### 2️⃣ Run the App
```bash
flutter run
```

### 3️⃣ Select Your Device
When prompted, choose from available devices (emulator/simulator/physical device).

---

## ✅ What's Included

### 📱 **8 Complete Screens**
1. ✨ **Splash Screen** - Animated intro with floating circles
2. 📝 **Signup Screen** - User registration
3. 🔐 **Login Screen** - User authentication  
4. 📡 **Device Pairing** - Connect Axonix devices
5. 📅 **Timeline** - Memory feed with cards
6. 📖 **Memory Detail** - Full memory view
7. 💬 **Chat AI** - AI assistant interface
8. ⚙️ **Settings** - 6-tab comprehensive settings

### 🎨 **Design Fidelity**
- ✅ Exact colors from screenshots (#00D9FF cyan, dark backgrounds)
- ✅ Proper spacing and padding
- ✅ Matching typography
- ✅ Icon sizes and positioning
- ✅ Reusable component library

### 🧩 **Reusable Widgets**
- `CustomButton` - Primary and outlined buttons
- `CustomInputField` - Text inputs with password toggle
- `MemoryCard` - Timeline memory cards
- `DeviceListItem` - Device connection items
- `SettingsMenuItem` - Settings list items

### 🎯 **Navigation**
All screens connected with named routes:
- `/` → Splash
- `/signup` → Signup
- `/login` → Login
- `/device-pairing` → Device Pairing
- `/timeline` → Timeline
- `/memory-detail` → Memory Detail
- `/chat` → AI Chat
- `/settings` → Settings

---

## 🎪 Screen Flow

```
Splash (3s auto)
    ↓
Signup ────────→ Login
    ↓                ↓
Device Pairing ←─────┘
    ↓
Timeline ←──────────┐
    ├─→ Memory Detail
    ├─→ Chat AI ─────┤
    └─→ Settings ────┘
```

---

## 📂 File Structure

```
lib/
├── config/theme.dart           # Colors & styles
├── screens/                    # All 8 screens
│   ├── splash_screen.dart
│   ├── signup_screen.dart
│   ├── login_screen.dart
│   ├── device_pairing_screen.dart
│   ├── timeline_screen.dart
│   ├── memory_detail_screen.dart
│   ├── chat_screen.dart
│   ├── settings_screen.dart
│   └── settings_tabs/          # 6 settings tabs
├── widgets/                    # Reusable components
└── main.dart                   # Entry & routing
```

---

## 🎨 Theme Colors

| Color | Hex | Usage |
|-------|-----|-------|
| Primary Cyan | `#00D9FF` | Buttons, highlights, icons |
| Dark BG | `#0A0E1A` | Screen background |
| Card BG | `#151B2E` | Cards, containers |
| Input BG | `#0F1525` | Text inputs |
| Text Primary | `#FFFFFF` | Main text |
| Text Secondary | `#8B95B0` | Subtitles, hints |

---

## 🔥 Hot Tips

### Fast Development
```bash
# Run with hot reload enabled (default)
flutter run

# Run on specific device
flutter run -d <device-id>

# Check available devices
flutter devices
```

### No Assets Needed
The app works without any images! It shows:
- Text fallback for logo
- Placeholder icons for missing images
- Material Icons for all UI elements

### Test It
```bash
# Run tests
flutter test

# Run specific test
flutter test test/widget_test.dart
```

---

## 🐛 Troubleshooting

### "No devices found"
Start an emulator:
- Android: Android Studio → AVD Manager
- iOS: Open Simulator app (Mac only)
- Web: Chrome will auto-start

### "Package not found"
```bash
flutter clean
flutter pub get
```

### Changes not showing
Use **Hot Restart** instead of Hot Reload:
- VS Code: `Ctrl+Shift+F5` (Windows) / `Cmd+Shift+F5` (Mac)
- Terminal: Press `R` (capital)

---

## 🎯 Next Steps

1. **Run the app** - `flutter run`
2. **Explore all screens** - Follow the navigation flow
3. **Check settings tabs** - 6 different configuration pages
4. **Try the chat** - AI assistant interface
5. **Customize theme** - Edit `lib/config/theme.dart`

---

## 📖 Full Documentation

See `AXONIX_PROJECT_README.md` for complete details on:
- Architecture
- Adding features
- State management
- Backend integration
- Deployment

---

**Ready to go! Just run `flutter run` 🚀**
