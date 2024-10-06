import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thuprai_clone/theme/custom_theme.dart';

class BaseListView extends StatelessWidget {
  final List<String> titles;
  final Function(int) onTap;
  final List<String> imageUrls;
  final List<String> profiles;
  final TextStyle? titleStyle;
  final double? itemWidth;
  final double? itemHeight;
  final double? imageHeight;

  const BaseListView({
    Key? key,
    required this.titles,
    required this.onTap,
    required this.imageUrls,
    required this.profiles,
    this.titleStyle,
    this.itemWidth,
    this.itemHeight,
    this.imageHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: titles.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: GestureDetector(
          onTap: () => onTap(index),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: imageHeight ?? 100.h,
                width: itemWidth ?? 80.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrls[index]),
                    fit: BoxFit.fitHeight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(height: 3.h),
              SizedBox(
                width: itemWidth ?? 80.w,
                child: Text(
                  titles[index],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: titleStyle ??
                      CustomTheme.bodyLarge(context)?.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
