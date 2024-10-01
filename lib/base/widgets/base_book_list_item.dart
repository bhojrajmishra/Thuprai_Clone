import 'package:flutter/material.dart';

class BookListItem extends StatelessWidget {
  final String? title;
  final String? imageUrl;

  const BookListItem({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: 100.0, // You can customize this size
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book Cover Image
          imageUrl != null
              ? Image.network(
                  imageUrl!,
                  height: 100.0,
                  width: 100.0,
                  fit: BoxFit.cover,
                )
              : Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.grey,
                  child: const Center(child: Text('No Image')),
                ),
          const SizedBox(height: 5),
          // Book Title
          Text(
            title ?? 'No Title',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
