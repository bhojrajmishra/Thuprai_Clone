import 'package:flutter/material.dart';

class BaseErrorMessage extends StatelessWidget {
  final String message;
  const BaseErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
            Text('Please try again later', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
