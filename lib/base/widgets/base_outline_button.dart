import 'package:flutter/material.dart';

class BaseOutlineButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function() onPressed;
  const BaseOutlineButton(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            side: WidgetStateProperty.all(BorderSide(
                color: Colors.blue, width: 1.0, style: BorderStyle.solid))),
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
        ));
  }
}
