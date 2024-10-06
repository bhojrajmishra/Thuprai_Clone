import 'package:flutter/material.dart';

class BaseTextButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final TextStyle? textStyle; // Add this line

  const BaseTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle, // Use the textStyle here
      ),
    );
  }
}
