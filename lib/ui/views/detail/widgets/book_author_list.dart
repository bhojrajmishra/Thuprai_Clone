import 'package:flutter/material.dart';

class BookAuthorsList extends StatelessWidget {
  final List<dynamic>? authors;

  const BookAuthorsList({Key? key, this.authors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: authors?.length ?? 0,
      itemBuilder: (context, index) {
        final author = authors?[index];
        return Row(
          children: [
            Text(
              author?.name ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            Text(author?.name ?? ''),
          ],
        );
      },
    );
  }
}
