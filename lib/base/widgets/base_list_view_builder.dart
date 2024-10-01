import 'package:flutter/material.dart';

/// A custom ListView widget that displays a network image, title, and onTap action.
class BaseListView extends StatelessWidget {
  final List<String?> imageUrl;
  final List<String?> title;
  final Function(int index) onTap; // Updated onTap to accept index
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
        return InkWell(
          onTap: () => onTap(index), // Pass the index to onTap
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl[index] ?? 'https://via.placeholder.com/150',
                    fit: BoxFit.contain,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title[index] ?? 'No Title',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
