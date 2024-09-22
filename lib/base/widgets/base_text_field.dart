import 'package:flutter/material.dart';

/// A custom text form field widget that wraps a [TextFormField] with commonly used configurations.
///
/// The widget provides additional customization options through its parameters [controller], [labelText], [obscureText], [validator], [enableSuggestions],[autocorrect],[keyboardType] ,  allowing you to control
class BaseTextField extends StatelessWidget {
  /// Controls the text being edited.
  final TextEditingController controller;

  /// The label text displayed above the text field.
  final String labelText;

  /// Whether the text should be obscured (e.g., for passwords).
  final bool obscureText;

  /// An optional validation function to validate the text field input.
  final FormFieldValidator<String>? validator;

  /// Whether suggestions for input are shown, default is true.
  final bool enableSuggestions;

  /// Whether autocorrect is enabled, default is true.
  final bool autocorrect;

  /// The type of keyboard to use for the text field.
  final TextInputType keyboardType;

  /// Required constructor for the [BaseTextField] widget.
  const BaseTextField({
    required this.controller,
    required this.labelText,
    required this.obscureText,
    this.validator,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.keyboardType = TextInputType.text,
    super.key,
  });

  /// Builds the text form field with the provided parameters.
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode:
          AutovalidateMode.onUserInteraction, // Validate on user interaction
      controller: controller,
      obscureText: obscureText, // Ensure obscureText is not null
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
