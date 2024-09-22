import 'package:flutter/material.dart';

class BaseBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavigationBarItem> items;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;

  const BaseBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: items,
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
      selectedItemColor: selectedItemColor ?? Colors.white,
      unselectedItemColor: unselectedItemColor ?? Colors.white.withOpacity(0.6),
      type: BottomNavigationBarType.fixed,
    );
  }
}
