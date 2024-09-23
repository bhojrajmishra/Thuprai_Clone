import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/base/widgets/base_carousel.dart';
import 'package:thuprai_clone/base/widgets/base_list_view_builder.dart';
import 'package:thuprai_clone/ui/common/app_colors.dart';
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
      body: Column(
        children: [
          Center(
            child: BaseCarousel(
              imgaddress: viewModel.items[0].imageUrl,
            ),
          ),
          verticalSpaceSmall,
          Expanded(
            child: BaseListView(
              imageUrl: viewModel.items[0].imageUrl,
              title: viewModel.items[0].title,
              onTap: () {},
              profiles: viewModel.items,
            ),
          ),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}


// BaseListView(
//                 imageUrl: viewModel.items[0].imageUrl,
//                 title: viewModel.items[0].title,
//                 onTap: () {},
//                 profiles: viewModel.items),
          