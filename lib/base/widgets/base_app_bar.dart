import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final List<Widget>? actions;
  const BaseAppBar(
      {super.key,
      required this.title,
      required this.backgroundColor,
      this.actions});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title,
          style: const TextStyle(color: Color.fromARGB(255, 33, 110, 243))),
      iconTheme: IconThemeData(color: const Color.fromARGB(255, 33, 110, 243)),
      backgroundColor: backgroundColor,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
