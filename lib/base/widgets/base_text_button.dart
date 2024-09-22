import 'package:flutter/material.dart';

class BaseTextButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const BaseTextButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(text));
  }
}
