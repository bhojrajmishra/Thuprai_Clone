import 'package:flutter/material.dart';
import 'package:thuprai_clone/base/widgets/base_outline_button.dart';

class BookFormatSelector extends StatelessWidget {
  final dynamic paperback;
  final dynamic ebook;

  const BookFormatSelector({
    Key? key,
    this.paperback,
    this.ebook,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (paperback != null)
          Expanded(
            child: BaseOutlineButton(
              title: 'Paperback',
              subtitle: 'Rs. ${paperback?.sellingPrice}',
              onPressed: () {},
            ),
          ),
        if (paperback != null && ebook != null) const SizedBox(width: 16),
        if (ebook != null)
          Expanded(
            child: BaseOutlineButton(
              title: 'E-book',
              subtitle: 'Rs. ${ebook?.sellingPrice}',
              onPressed: () {},
            ),
          ),
      ],
    );
  }
}
