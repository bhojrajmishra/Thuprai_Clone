import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BaseCarousel extends StatefulWidget {
  final List<String?> imageUrls;
  final Function(int index) onTap;

  const BaseCarousel({
    Key? key,
    required this.imageUrls,
    required this.onTap,
  }) : super(key: key);

  @override
  _BaseCarouselState createState() => _BaseCarouselState();
}

class _BaseCarouselState extends State<BaseCarousel> {
  int activeIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
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
                    image: NetworkImage(imageUrl!),
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
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
          carouselController: _controller,
        ),
        Positioned(
          bottom: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: widget.imageUrls.length,
              effect: const ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: Colors.white,
                dotColor: Colors.white54,
              ),
              onDotClicked: (index) {
                _controller.animateToPage(index);
              },
            ),
          ),
        ),
      ],
    );
  }
}
