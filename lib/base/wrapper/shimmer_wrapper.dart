import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWrapper extends StatelessWidget {
  const ShimmerWrapper(
      {super.key,
      required this.baseColor,
      required this.child,
      required this.highlightColor});
  final Color baseColor;
  final Color highlightColor;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: child,
    );
  }
}
