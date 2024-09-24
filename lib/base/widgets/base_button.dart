import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color color;
  final double? width;
  final double? height;
  const BaseButton({
    required this.text,
    required this.onPressed,
    required this.color,
    this.width,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: color,
        child: MaterialButton(
          minWidth: width,
          height: height,
          padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: onPressed, // add this here
          child: Text(text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15)
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
