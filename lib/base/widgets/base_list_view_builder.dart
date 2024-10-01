import 'package:flutter/material.dart';

/// A custom ListView widget that displays a network image, title, and onTap action.
class BaseListView extends StatelessWidget {
  final List<String?> imageUrl;
  final String? title;
  final Function onTap;
  final List<String?> profiles;

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
        return GestureDetector(
          onTap: () => onTap(index),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl[index]!,
                    fit: BoxFit.fitHeight,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                title!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
