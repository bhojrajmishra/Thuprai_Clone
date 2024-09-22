import 'package:flutter/material.dart';

class BaseGestureDetector extends StatelessWidget {
  final String title;
  final String imageaddress;
  final Function() onPressed;

  const BaseGestureDetector(
      {super.key,
      required this.title,
      required this.imageaddress,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
        debugPrint('Container clicked');
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(13, 21, 1, 1),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.network(imageaddress),
                  const SizedBox(width: 10),
                  Text(title)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
