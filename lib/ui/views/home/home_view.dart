import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/base/widgets/base_button.dart';
import 'package:thuprai_clone/base/widgets/base_carousel.dart';
import 'package:thuprai_clone/base/widgets/base_list_view_builder.dart';
import 'package:thuprai_clone/base/widgets/base_text_button.dart';
import 'package:thuprai_clone/ui/common/ui_helpers.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    final data = viewModel.fetchData;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await viewModel.getBooks();
        },
        child: viewModel.isBusy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Carousel
                      Center(
                        child: BaseCarousel(
                          imageUrls:
                              data!.featured!.map((e) => e.image).toList(),
                          onTap: viewModel.onCarouselItemTapped,
                        ),
                      ),

                      SizedBox(
                        height:
                            80, // Increased height to accommodate BaseButton's top padding
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: data.featured!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: BaseButton(
                                text: data.featured![index].title,
                                onPressed: () {
                                  viewModel.onItemSelected(
                                    data.featured![index].title!,
                                  );
                                },
                                color: const Color.fromARGB(154, 68, 171, 255),
                                // width: 10, // Set a fixed width for the button
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                      Row(
                        children: [
                          Text(
                            "Featured",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          BaseTextButton(
                              text: 'View All',
                              onPressed: () {
                                // Add navigation to view all
                                debugPrint('View All clicked');
                              }),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height:
                            150, // Set a fixed height for the horizontal list
                        child: BaseListView(
                          title: data.featured!.map((e) => e.title).toList(),
                          onTap: () {
                            viewModel.onItemSelected(
                              data.featured!.map((e) => e.title).toList()
                                  as String,
                            );
                          },
                          imageUrl: data.featured!.map((e) => e.image).toList(),
                          profiles: data.featured!.map((e) => e.image).toList(),
                        ),
                      ),

                      // Second section of BaseListView
                      Row(
                        children: [
                          const Text(
                            "New Releases",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          BaseTextButton(text: 'View All', onPressed: () {})
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height:
                            150, // Set a fixed height for the horizontal list
                        child: BaseListView(
                          title: data.newReleases!.map((e) => e.title).toList(),
                          onTap: () {
                            viewModel.onItemSelected(
                              data.newReleases!.map((e) => e.title).toList()
                                  as String,
                            );
                          },

                          imageUrl: data.newReleases!
                              .map((e) => e.frontCover)
                              .toList(),
                          profiles: data.newReleases!
                              .map((e) => e.frontCover)
                              .toList(),
                          // Add image
                        ),
                      ),
                      verticalSpaceMedium,
                      // Third section of BaseListView
                      Row(
                        children: [
                          const Text(
                            "Recent E-book",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          BaseTextButton(
                              text: 'View All',
                              onPressed: () {
                                // Add navigation to view all

                                debugPrint('View All clicked');
                              })
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height:
                            150, // Set a fixed height for the horizontal list
                        child: BaseListView(
                          title: data.ebooks!.map((e) => e.title).toList(),
                          onTap: () {
                            viewModel.onItemSelected(
                              data.ebooks!.map((e) => e.title).toList()
                                  as String,
                            );
                          },
                          imageUrl:
                              data.ebooks!.map((e) => e.frontCover).toList(),
                          profiles:
                              data.ebooks!.map((e) => e.frontCover).toList(),
                        ),
                      ),
                      verticalSpaceMedium,
                      // Fourth section of BaseListView
                      Row(
                        children: [
                          const Text(
                            "Recent Audiobook",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          BaseTextButton(
                              text: 'View All',
                              onPressed: () {
                                // Add navigation to view all
                                debugPrint('View All clicked');
                              })
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height:
                            150, // Set a fixed height for the horizontal list
                        child: BaseListView(
                          title: data.audiobooks!.map((e) => e.title).toList(),
                          onTap: () {
                            viewModel.onItemSelected(
                              data.audiobooks!.map((e) => e.title).toList()
                                  as String,
                            );
                          },
                          imageUrl: data.audiobooks!
                              .map((e) => e.frontCover)
                              .toList(),
                          profiles: data.audiobooks!
                              .map((e) => e.frontCover)
                              .toList(),
                        ),
                      ),
                      verticalSpaceMedium,
                      // Fifth section of BaseListView
                      Row(
                        children: [
                          const Text(
                            "All Time Best Seller",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          BaseTextButton(
                              text: 'View All',
                              onPressed: () {
                                // Add navigation to view all
                                debugPrint('View All clicked');
                              })
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height:
                            150, // Set a fixed height for the horizontal list
                        child: BaseListView(
                          title: data.bestsellingEbooks!
                              .map((e) => e.title)
                              .toList(),
                          onTap: () {
                            viewModel.onItemSelected(
                              data.bestsellingEbooks!
                                  .map((e) => e.title)
                                  .toList() as String,
                            );
                          },
                          imageUrl: data.bestsellingEbooks!
                              .map((e) => e.frontCover)
                              .toList(),
                          profiles: data.bestsellingEbooks!
                              .map((e) => e.frontCover)
                              .toList(),
                        ),
                      ),
                      verticalSpaceMedium,
                      // Sixth section of BaseListView
                      //   Row(
                      //     children: [
                      //       const Text(
                      //         "Nepali Biography and Memoiries",
                      //         style: TextStyle(
                      //             fontSize: 10, fontWeight: FontWeight.bold),
                      //       ),
                      //       const Spacer(),
                      //       BaseTextButton(
                      //           text: 'View All',
                      //           onPressed: () {
                      //             // Add navigation to view all
                      //             debugPrint('View All clicked');
                      //           })
                      //     ],
                      //   ),
                      //   const SizedBox(height: 10),
                      //   SizedBox(
                      //     height:
                      //         150, // Set a fixed height for the horizontal list
                      //     child: BaseListView(
                      //       title: data.additionalLists!
                      //           .map((e) => e.title)
                      //           .toList(),

                      //       onTap: () {
                      //         viewModel.onItemSelected(
                      //           data.additionalLists!.map((e) => e.title).toList()
                      //               as String,
                      //         );
                      //       },
                      //       imageUrl: data.additionalLists!
                      //           .map((e) => e.frontCover)
                      //           .toList(),
                      //       profiles: data.additionalLists!
                      //           .map((e) => e.frontCover)
                      //           .toList(),
                      //     ),
                      //   ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
