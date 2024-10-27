// home_shimmer.dart
import 'package:flutter/material.dart';
import 'package:thuprai_clone/base/wrapper/shimmer_wrapper.dart';
import 'package:thuprai_clone/constants/app_text_constants.dart';
import 'package:thuprai_clone/ui/common/ui_helpers.dart';
import 'package:thuprai_clone/theme/custom_theme.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerWrapper(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carousel shimmer
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              verticalSpaceMedium,
              // Featured buttons shimmer
              SizedBox(
                height: 80,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => Container(
                    width: 120,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              verticalSpaceMedium,

              // Book sections shimmer
              _buildBookSection(context, AppTextConstants.newReleaseTitle),
              _buildBookSection(context, AppTextConstants.recentEbook),
              _buildBookSection(context, AppTextConstants.recentAudioBook),
              _buildBookSection(context, AppTextConstants.bestSeller),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookSection(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Row(
          children: [
            Text(
              title,
              style: CustomTheme.displayLarge(context)?.copyWith(fontSize: 18),
            ),
            const Spacer(),
            Container(
              width: 60,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Book list
        SizedBox(
          height: 150,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => Container(
              width: 100,
              margin: const EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 12,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 12,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        verticalSpaceMedium,
      ],
    );
  }
}
