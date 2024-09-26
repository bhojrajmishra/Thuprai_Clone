import 'package:flutter/material.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carousel
              Center(
                child: BaseCarousel(
                  imageUrls: [viewModel.items[0].imageUrl],
                  onTap: (index) => index,
                ),
              ),
              //  First section of BaseListView
              SizedBox(
                height:
                    80, // Increased height to accommodate BaseButton's top padding
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: viewModel.buttonItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: BaseButton(
                        text: viewModel.buttonItems[index].text,
                        onPressed: () {
                          viewModel.onButtonSelected(
                            viewModel.buttonItems[index].text,
                          );
                        },
                        color: const Color.fromARGB(154, 68, 171, 255),
                        // width: 10, // Set a fixed width for the button
                      ),
                    );
                  },
                ),
              ),
              verticalSpaceMedium,

              Row(
                children: [
                  const Text(
                    "Popular",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                height: 150, // Set a fixed height for the horizontal list
                child: BaseListView(
                  title: viewModel.items[0].title,
                  onTap: () {
                    viewModel.onItemSelected(
                      viewModel.items[0].title,
                    );
                  },
                  profiles: viewModel.items,
                ),
              ),
              verticalSpaceMedium,

              // Second section of BaseListView
              Row(
                children: [
                  const Text(
                    "New Releases",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  BaseTextButton(text: 'View All', onPressed: () {})
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 150, // Set a fixed height for the horizontal list
                child: BaseListView(
                  title: viewModel.items[0].title,
                  onTap: () {
                    viewModel.onItemSelected(viewModel.items[0].title);
                  },
                  profiles: viewModel.items,
                ),
              ),
              verticalSpaceMedium,

              // Third section of BaseListView
              Row(
                children: [
                  const Text(
                    "Recent E-book",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                height: 150, // Set a fixed height for the horizontal list
                child: BaseListView(
                  title: viewModel.items[0].title,
                  onTap: () {
                    viewModel.onItemSelected(viewModel.items[0].title);
                  },
                  profiles: viewModel.items,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}

//  const SizedBox(height: 10),
//         SizedBox(
//           height: 150,
//           child: BaseListView(
//             title: title,
//             onTap: (index) {
//               viewModel.onItemSelected(books[index].slug);
//             },
//             profiles: books
//                 .map((book) => BookListItem(
//                       title: book.title,
//                       imageUrl: book.frontCover,
//                     ))
//                 .toList(),
//           ),
//         ),
//       ],
//     );
//   }
