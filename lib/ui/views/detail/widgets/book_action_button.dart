import 'package:flutter/material.dart';
import 'package:thuprai_clone/base/widgets/base_button.dart';

class BookActionButtons extends StatelessWidget {
  final VoidCallback? onBuyNowPressed;
  final VoidCallback? onAddToCartPressed;

  const BookActionButtons({
    Key? key,
    this.onBuyNowPressed,
    this.onAddToCartPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BaseButton(
            width: 150,
            text: 'Buy Now',
            onPressed: onBuyNowPressed,
            color: Colors.blue,
          ),
          const SizedBox(width: 16),
          BaseButton(
            width: 150,
            text: 'Add to Cart',
            onPressed: onAddToCartPressed,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
