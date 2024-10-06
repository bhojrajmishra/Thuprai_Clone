import 'package:flutter/material.dart';

class BaseDivider extends StatelessWidget {
  final Color? color;
  final double thickness;
  final double indent;
  final double endIndent;

  const BaseDivider({
    Key? key,
    this.color,
    this.thickness = 1.0,
    this.indent = 0.0,
    this.endIndent = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
    );
  }
}
