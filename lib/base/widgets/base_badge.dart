import 'package:flutter/material.dart';

/// A custom badge widget that can be easily customized and reused.
///
/// This widget provides a flexible badge with customizable content,
/// background color, text style, shape, and positioning options.
class BaseBadge extends StatelessWidget {
  /// The content to be displayed inside the badge.
  final Widget child;

  /// The background color of the badge.
  final Color backgroundColor;

  /// The text style for the badge content (if the child is a Text widget).
  final TextStyle? textStyle;

  /// The shape of the badge.
  final ShapeBorder shape;

  /// The padding inside the badge.
  final EdgeInsetsGeometry padding;

  /// The position of the badge relative to its parent.
  final AlignmentGeometry alignment;

  /// Creates a [BaseBadge] widget.
  ///
  /// The [child] parameter is required and specifies the content of the badge.
  const BaseBadge({
    Key? key,
    required this.child,
    this.backgroundColor = Colors.red,
    this.textStyle,
    this.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    this.alignment = Alignment.topRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Material(
        color: backgroundColor,
        shape: shape,
        elevation: 2,
        child: Padding(
          padding: padding,
          child: DefaultTextStyle(
            style: textStyle ??
                Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
            child: child,
          ),
        ),
      ),
    );
  }
}
