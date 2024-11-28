import 'package:flutter/material.dart';

class BookDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onCartPressed;

  const BookDetailAppBar({
    Key? key,
    this.title,
    this.onCartPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? 'Book Detail'),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: onCartPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
