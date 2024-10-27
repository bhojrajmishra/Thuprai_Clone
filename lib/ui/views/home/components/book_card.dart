import 'package:flutter/material.dart';
import 'package:thuprai_clone/theme/custom_theme.dart';
import 'package:thuprai_clone/ui/views/home/model/home_response_model.dart';

class BookCard extends StatelessWidget {
  final Audiobook book;
  final Function(String) onTap;

  const BookCard({
    Key? key,
    required this.book,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(book.slug ?? ''),
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                book.frontCover ?? '',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              book.title ?? '',
              style: CustomTheme.bodyLarge(context)?.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
