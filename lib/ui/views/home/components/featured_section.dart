import 'package:flutter/material.dart';
import 'package:thuprai_clone/base/widgets/base_button.dart';
import 'package:thuprai_clone/base/widgets/base_carousel.dart';
import 'package:thuprai_clone/theme/custom_theme.dart';
import 'package:thuprai_clone/ui/views/home/model/home_response_model.dart';
import 'package:thuprai_clone/ui/common/ui_helpers.dart';

class FeaturedSection extends StatelessWidget {
  final List<Featured> featuredItems;
  final Function(int) onCarouselTap;
  final Function(String) onItemTap;

  const FeaturedSection({
    Key? key,
    required this.featuredItems,
    required this.onCarouselTap,
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (featuredItems.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        Center(
          child: BaseCarousel(
            imageUrls: featuredItems.map((item) => item.image ?? '').toList(),
            onTap: onCarouselTap,
          ),
        ),
        verticalSpaceMedium,
        SizedBox(
          height: 80,
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: featuredItems.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: BaseButton(
                text: featuredItems[index].title ?? '',
                onPressed: () => onItemTap(featuredItems[index].slug ?? ''),
                color: CustomTheme.primary(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
