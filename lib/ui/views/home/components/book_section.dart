import 'package:flutter/material.dart';
import 'package:thuprai_clone/base/widgets/base_text_button.dart';
import 'package:thuprai_clone/constants/app_text_constants.dart';
import 'package:thuprai_clone/theme/custom_theme.dart';
import 'package:thuprai_clone/ui/views/home/components/book_card.dart';
import 'package:thuprai_clone/ui/views/home/model/home_response_model.dart';
import 'package:thuprai_clone/ui/common/ui_helpers.dart';

class BookSection extends StatelessWidget {
  final String title;
  final List<Audiobook> items;
  final VoidCallback onViewAll;
  final Function(String) onItemTap;

  const BookSection({
    Key? key,
    required this.title,
    required this.items,
    required this.onViewAll,
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        const SizedBox(height: 10),
        _buildBookList(context),
        verticalSpaceMedium,
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: CustomTheme.displayLarge(context)?.copyWith(fontSize: 18),
        ),
        const Spacer(),
        BaseTextButton(
          text: AppTextConstants.viewAll,
          onPressed: onViewAll,
          textStyle: TextStyle(
            color: CustomTheme.primary(context),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildBookList(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) => BookCard(
          book: items[index],
          onTap: onItemTap,
        ),
      ),
    );
  }
}
