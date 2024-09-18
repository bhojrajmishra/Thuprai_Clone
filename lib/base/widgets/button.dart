import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const Button({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 7, 111, 196),
        child: MaterialButton(
          minWidth: double.infinity,
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
