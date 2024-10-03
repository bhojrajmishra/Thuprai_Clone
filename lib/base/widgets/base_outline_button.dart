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
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.blue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(),
          ),
        ),
        child: ListTile(
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          subtitle: Text(subtitle, textAlign: TextAlign.center),
        ));
  }
}
