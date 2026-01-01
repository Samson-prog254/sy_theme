# sy_theme

A comprehensive Flutter UI theme package providing reusable widgets, color constants, and navigation components for consistent app design.

## Features

- **Color Constants**: Pre-defined color palette with main, supporting, dark, and accent colors
- **Bottom Navigation**: Customizable bottom navigation bar with location-based active states
- **Curved Button**: Stylish button component with customizable colors, borders, and dimensions
- **Footer Widget**: Branded footer component with love icon
- **Assets Included**: Built-in icons and assets

## Getting started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  sy_theme: ^0.0.1
```

Then run:
```bash
flutter pub get
```

## Usage

### Import the package
```dart
import 'package:sy_theme/sy_theme.dart';
```

### Colors
```dart
Container(
  color: SyColors.mainColor,
  child: Text(
    'Hello World',
    style: TextStyle(color: SyColors.supportingColor),
  ),
)
```

### Bottom Navigation Bar
```dart
bottomNavigationBar: SyBottomNavBar(
  currentLocation: 'home',
  items: [
    SyBottomNavItem(
      icon: Icons.home,
      label: "Home",
      location: 'home',
      onTap: () => Navigator.pushNamed(context, '/home'),
    ),
    SyBottomNavItem(
      icon: Icons.shopping_bag,
      label: "Orders",
      location: 'orders',
      onTap: () => Navigator.pushNamed(context, '/orders'),
    ),
  ],
),
```

### Curved Button
```dart
CurvedButton(
  text: 'Click Me',
  onPressed: () => print('Button pressed'),
  buttonColor: SyColors.mainColor,
  textColor: Colors.white,
  width: 120,
  height: 50,
)
```

### Footer
```dart
SygenFooter()
```

 
## Additional information

This package is designed to provide consistent theming across Flutter applications. All components are customizable and follow Material Design principles.

For issues and feature requests, please visit our [GitHub repository](https://github.com/Samson-prog254/sy_theme).
