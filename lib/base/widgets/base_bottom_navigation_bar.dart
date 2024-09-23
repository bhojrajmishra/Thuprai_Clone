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
      backgroundColor: backgroundColor ?? Colors.white,
      selectedItemColor: selectedItemColor ?? Colors.black,
      unselectedItemColor: unselectedItemColor ??
          const Color.fromARGB(37, 22, 3, 3).withOpacity(0.6),
      type: BottomNavigationBarType.fixed,
    );
  }
}
