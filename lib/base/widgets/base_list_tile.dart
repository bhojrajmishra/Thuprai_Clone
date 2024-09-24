import 'package:flutter/material.dart';

class BaseListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Icon? leading;
  final Icon? trailing;
  BaseListTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: leading,
      trailing: trailing,
    );
  }
}
