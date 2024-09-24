import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/base/widgets/base_app_bar.dart';
import 'package:thuprai_clone/base/widgets/base_bottom_navigation_bar.dart';
import 'package:thuprai_clone/base/widgets/base_divider.dart';
import 'package:thuprai_clone/base/widgets/base_list_tile.dart';
import 'package:thuprai_clone/base/widgets/base_outline_button.dart';
import 'package:thuprai_clone/ui/common/ui_helpers.dart';

import 'detail_viewmodel.dart';

class DetailView extends StackedView<DetailViewModel> {
  const DetailView({
    Key? key,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar:
          BaseAppBar(title: "title", backgroundColor: Colors.white, actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
      ]),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: 500,
                height: 250,
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                padding: const EdgeInsets.only(
                    left: 10, right: 25.0, top: 25.0, bottom: 25.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          viewModel.items[0].imageUrl,
                          width: 150,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      horizontalSpaceMedium,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            viewModel.items[0].title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            viewModel.items[0].author,
                          ),
                          Text(
                            viewModel.items[0].description,
                          ),
                        ],
                      ),
                    ]),
              ),
              verticalSpaceMedium,
              BaseOutlineButton(
                title: 'Paperback',
                subtitle: 'Rs.750',
                onPressed: () {},
              ),
              BaseListTile(
                  title: viewModel.descriptions[0].title,
                  subtitle: viewModel.descriptions[0].subtitle),
              const BaseDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: viewModel.publishers.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Text(
                              viewModel.publishers.keys.elementAt(index),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            horizontalSpaceSmall,
                            Text(
                              viewModel.publishers.values.elementAt(index),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  BaseBottomNavigationBar(
                    currentIndex: 0,
                    onTap: (index) => index,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.search),
                        label: 'Search',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart),
                        label: 'Cart',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  DetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DetailViewModel();
}
