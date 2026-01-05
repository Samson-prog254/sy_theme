# sy_theme

A comprehensive Flutter UI design system providing reusable components, consistent theming, and flexible customization for rapid app development.

## 🚀 Features

### 🎨 **Design Foundations**
- **Colors**: Semantic color system with brand, status, and neutral colors
- **Typography**: Consistent text styles (H1-H6, body, labels, captions)
- **Spacing**: Standardized spacing system to avoid magic numbers

### 🧩 **UI Components**
- **Buttons**: Primary, secondary, outline, text, and danger variants with loading states
- **Text Fields**: Email, password, search fields with validation support
- **Cards**: Elevated, outlined, and filled cards with info and stats variants
- **Navigation**: App bars, bottom navigation, and search bars
- **Feedback**: Loading indicators, snackbars, alerts, and empty states
- **Avatars**: Profile avatars with online status indicators
- **Legacy**: Bottom navigation, curved buttons, and footer components

### ⚙️ **Customization**
- Flexible theming with custom colors
- Configurable sizes and variants
- Easy-to-override default styles
- Consistent design tokens

## 📦 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  sy_theme: ^1.0.0
```

Then run:
```bash
flutter pub get
```

## 🎯 Quick Start

### Import the package
```dart
import 'package:sy_theme/sy_theme.dart';
```

### Use Design Tokens
```dart
Container(
  padding: EdgeInsets.all(SySpacing.md),
  decoration: BoxDecoration(
    color: SyColors.mainColor,
    borderRadius: BorderRadius.circular(SySpacing.radiusMd),
  ),
  child: Text(
    'Hello World',
    style: SyTextStyles.h3.copyWith(color: Colors.white),
  ),
)
```

## 🧩 Component Examples

### Buttons
```dart
// Primary button
SyButton(
  label: 'Get Started',
  onPressed: () => print('Pressed'),
)

// Button with icon and loading state
SyButton(
  label: 'Save',
  icon: Icons.save,
  variant: SyButtonVariant.secondary,
  size: SyButtonSize.large,
  isLoading: isLoading,
  onPressed: () => saveData(),
)
```

### Text Fields
```dart
// Basic text field
SyTextField(
  label: 'Full Name',
  hint: 'Enter your full name',
  controller: nameController,
)

// Specialized fields
SyEmailField(controller: emailController)
SyPasswordField(controller: passwordController)
SySearchField(onChanged: (query) => search(query))
```

### Cards
```dart
// Info card
SyInfoCard(
  title: 'Profile Settings',
  subtitle: 'Manage your account preferences',
  leading: Icon(Icons.settings),
  trailing: Icon(Icons.arrow_forward_ios),
  onTap: () => navigateToSettings(),
)

// Stats card
SyStatsCard(
  title: 'Total Sales',
  value: '\$12,345',
  subtitle: '+15% from last month',
  icon: Icons.trending_up,
  iconColor: SyColors.success,
)
```

### Navigation
```dart
// App bar
SyAppBar(
  title: 'Dashboard',
  actions: [
    IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
  ],
)

// Bottom navigation
SyBottomNavBar(
  currentLocation: 'home',
  items: [
    SyBottomNavItem(
      icon: Icons.home,
      label: "Home",
      location: 'home',
      onTap: () => navigateToHome(),
    ),
    // ... more items
  ],
)
```

### Feedback Components
```dart
// Show snackbar
SySnackbar.show(
  context,
  'Operation completed successfully!',
  type: SySnackbarType.success,
)

// Show alert dialog
SyAlert.show(
  context,
  title: 'Confirm Delete',
  message: 'This action cannot be undone.',
  type: SyAlertType.warning,
  confirmText: 'Delete',
  cancelText: 'Cancel',
)

// Empty state
SyEmptyState(
  message: 'No data available',
  description: 'Try refreshing or check back later',
  icon: Icons.inbox,
  action: SyButton(
    label: 'Refresh',
    onPressed: () => refresh(),
  ),
)
```

## 🎨 Design System

### Colors
```dart
// Brand colors
SyColors.mainColor        // Primary brand color
SyColors.supportingColor  // Secondary brand color
SyColors.mainDarkColor    // Dark variant

// Semantic colors
SyColors.success    // Green for success states
SyColors.error      // Red for error states
SyColors.warning    // Orange for warning states
SyColors.info       // Blue for info states

// Neutral colors
SyColors.neutral50   // Lightest gray
SyColors.neutral900  // Darkest gray
```

### Typography
```dart
SyTextStyles.h1          // 32px, bold
SyTextStyles.h2          // 28px, bold
SyTextStyles.bodyLarge   // 16px, normal
SyTextStyles.bodyMedium  // 14px, normal
SyTextStyles.caption     // 12px, normal
```

### Spacing
```dart
SySpacing.xs    // 4px
SySpacing.sm    // 8px
SySpacing.md    // 16px
SySpacing.lg    // 24px
SySpacing.xl    // 32px
```

## 🔧 Customization

All components support customization through parameters:

```dart
SyButton(
  label: 'Custom Button',
  customColor: Colors.purple,
  customTextColor: Colors.white,
  onPressed: () {},
)

SyCard(
  customColor: Colors.blue.shade50,
  customElevation: 8,
  borderRadius: BorderRadius.circular(20),
  child: YourContent(),
)
```

## 📱 Example App

Run the example app to see all components in action:

```bash
cd example
flutter run
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🔗 Links

- [GitHub Repository](https://github.com/Samson-prog254/sy_theme)
- [Issues & Feature Requests](https://github.com/Samson-prog254/sy_theme/issues)
- [Example App](https://github.com/Samson-prog254/sy_theme/tree/main/example)
