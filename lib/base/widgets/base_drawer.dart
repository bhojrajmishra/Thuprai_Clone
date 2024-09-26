import 'package:flutter/material.dart';
import 'package:thuprai_clone/base/widgets/base_list_tile.dart';

class BaseDrawer extends StatelessWidget {
  final String header;
  final String title;
  final Icon? trailing;
  const BaseDrawer(
      {super.key, required this.header, required this.title, this.trailing});

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
            child: Text(header),
          ),
          ListTile(
            title: Text(title),
            trailing: trailing,
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
