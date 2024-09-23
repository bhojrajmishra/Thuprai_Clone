import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// A custom carousel widget that displays a list of images with a tap action
/// and a dot indicator for navigation.
class BaseCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final Function(int index) onTap;
  final CarouselController controller;
  const BaseCarousel({
    Key? key,
    required this.imageUrls,
    required this.onTap,
    required this.controller,
  }) : super(key: key);

  @override
  _BaseCarouselState createState() => _BaseCarouselState();
}

class _BaseCarouselState extends State<BaseCarousel> {
  int activeIndex = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          itemCount: widget.imageUrls.length,
          itemBuilder: (context, index, realIndex) {
            final imageUrl = widget.imageUrls[index];
            return GestureDetector(
              onTap: () => widget.onTap(index),
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 200,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
          ),
        ),
        const SizedBox(height: 10),
        // Dot indicator
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: widget.imageUrls.length,
          effect: ExpandingDotsEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: Colors.blueAccent,
            dotColor: Colors.grey.shade400,
          ),
          onDotClicked: (index) {
            // _controller.animateToPage(index);
          },
        ),
      ],
    );
  }
}
