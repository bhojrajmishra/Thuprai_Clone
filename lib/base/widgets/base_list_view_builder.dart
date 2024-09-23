import 'package:flutter/material.dart';

/// A custom ListView widget that displays a network image, title, and onTap action.
class BaseListView extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onTap;
  final List profiles;

  const BaseListView({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
    required this.profiles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: profiles.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: [
              Image.network(profiles[index].imageUrl,
                  fit: BoxFit.cover, width: 100, height: 100),
              Text(profiles[index].title),
            ],
          ),
        );
      },
    );
  }
}
