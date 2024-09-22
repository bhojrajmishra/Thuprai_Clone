import 'package:flutter/material.dart';

/// A custom theme class that defines the light and dark themes for the application.
///
/// This class provides two static methods, [lightTheme] and [darkTheme], which return
/// [ThemeData] objects configured with specific color schemes and text themes for light and dark modes.
class CustomTheme {
  /// Defines the light theme of the app.
  static ThemeData lightTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        surface: Colors.white,
        primary: Color.fromARGB(255, 16, 83, 18),
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
        buttonColor: Color.fromARGB(255, 7, 111, 196),
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  /// Defines the dark theme of the app.
  static ThemeData darkTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.dark(
        surface: Colors.black,
        primary: Color.fromARGB(255, 16, 83, 18),
        secondary: Colors.white,
        inversePrimary: Colors.black,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        bodyLarge: TextStyle(fontSize: 16, color: Colors.white70),
        labelMedium: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }

  static Color? surface(BuildContext context) {
    return Theme.of(context).colorScheme.surface;
  }

  static Color? primary(BuildContext context) {
    return Theme.of(context).colorScheme.primary;
  }

  static Color? secondary(BuildContext context) {
    return Theme.of(context).colorScheme.secondary;
  }

  static Color? inversePrimary(BuildContext context) {
    return Theme.of(context).colorScheme.inversePrimary;
  }

  static TextStyle? displayLarge(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge;
  }

  static TextStyle? bodyLarge(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge;
  }

  static TextStyle? labelMedium(BuildContext context) {
    return Theme.of(context).textTheme.labelMedium;
  }
}
