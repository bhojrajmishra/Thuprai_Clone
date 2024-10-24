import 'package:flutter/material.dart';
import 'package:thuprai_clone/base/wrapper/shimmer_wrapper.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerWrapper(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: Colors.white,
                height: 200,
                width: 300,
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 20, // Adjust the count based on your needs
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 200,
                        width: 300,
                        color: Colors.white,
                      ));
                },
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Adjust the count based on your needs
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 200,
                        width: 130,
                        color: Colors.white,
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
