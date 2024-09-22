import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BaseCarousel extends StatelessWidget {
  final String imgaddress;
  const BaseCarousel({super.key, required this.imgaddress});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        //1st Image of Slider
        Container(
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(imgaddress),
              fit: BoxFit.cover,
            ),
          ),
        ),
        //2nd Image of Slider
        Container(
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(imgaddress),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
      options: CarouselOptions(),
      carouselController: CarouselSliderController(),
    );
  }
}
