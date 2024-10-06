import 'package:flutter/material.dart';

/// A custom theme class that defines the light and dark themes for the application.
///
/// This class provides two static methods, [lightTheme] and [darkTheme], which return
/// [ThemeData] objects configured with specific color schemes and text themes for light and dark modes.
/// It also includes utility methods to easily access theme colors and text styles in widgets.
class CustomTheme {
  /// Defines the light theme of the app.
  static ThemeData lightTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        surface: Colors.white,
        primary: Color(0xFF105312), // Dark green
        secondary: Colors.grey,
        inversePrimary: Colors.white,
        onError: Colors.red,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
        labelMedium: TextStyle(fontSize: 14, color: Colors.black),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFF076FC4), // Blue
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  /// Defines the dark theme of the app.
  static ThemeData darkTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.dark(
        surface: Colors.black,
        primary:
            Color(0xFF2E7D32), // Lighter green for better contrast in dark mode
        secondary: Colors.white70,
        inversePrimary: Colors.black,
        onError: Colors.red,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        bodyLarge: TextStyle(fontSize: 16, color: Colors.white70),
        labelMedium: TextStyle(fontSize: 14, color: Colors.grey),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFF2196F3), // Lighter blue for dark mode
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  /// Returns the surface color from the current theme.
  static Color surface(BuildContext context) {
    return Theme.of(context).colorScheme.surface;
  }

  /// Returns the primary color from the current theme.
  static Color primary(BuildContext context) {
    return Theme.of(context).colorScheme.primary;
  }

  /// Returns the secondary color from the current theme.
  static Color secondary(BuildContext context) {
    return Theme.of(context).colorScheme.secondary;
  }

  /// Returns the inverse primary color from the current theme.
  static Color inversePrimary(BuildContext context) {
    return Theme.of(context).colorScheme.inversePrimary;
  }

  /// Returns the displayLarge text style from the current theme.
  static TextStyle? displayLarge(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge;
  }

  /// Returns the bodyLarge text style from the current theme.
  static TextStyle? bodyLarge(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge;
  }

  /// Returns the labelMedium text style from the current theme.
  static TextStyle? labelMedium(BuildContext context) {
    return Theme.of(context).textTheme.labelMedium;
  }

  /// Returns a color for base buttons, adapting to the current theme brightness.
  static Color baseButtonColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? const Color(0xFF9ACADB) // Light blue for light mode
        : const Color(0xFF0078D4); // Darker blue for dark mode
  }

  /// Returns a color for featured section backgrounds, adapting to the current theme brightness.
  static Color featuredSectionColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? const Color(0xFFF0F8FF) // Very light blue for light mode
        : const Color(0xFF1E1E1E); // Dark grey for dark mode
  }

  /// Returns a color for card backgrounds, adapting to the current theme brightness.
  static Color cardColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Colors.white
        : const Color(0xFF2C2C2C); // Dark grey for dark mode
  }

  /// Returns a shadow for elevated components, adapting to the current theme brightness.
  static List<BoxShadow> elevatedShadow(BuildContext context) {
    return [
      BoxShadow(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.black.withOpacity(0.1)
            : Colors.black.withOpacity(0.3),
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ];
  }

  /// Returns a gradient for featured items, adapting to the current theme brightness.
  static LinearGradient featuredGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Theme.of(context).brightness == Brightness.light
            ? const Color(0xFF9ACADB)
            : const Color(0xFF0078D4),
        Theme.of(context).brightness == Brightness.light
            ? const Color(0xFF76A5C4)
            : const Color(0xFF005A9E),
      ],
    );
  }
}
