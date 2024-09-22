import 'package:flutter/material.dart';

class BaseDrawer extends StatelessWidget {
  final String title;
  const BaseDrawer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Text(title),
          ),
          ListTile(
            title: Text(title),
            onTap: () {},
          ),
          ListTile(
            title: Text(title),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
