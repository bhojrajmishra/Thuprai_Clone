import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/base/widgets/base_badge.dart';
import 'package:thuprai_clone/base/widgets/base_bottom_navigation_bar.dart';
import 'package:thuprai_clone/ui/views/profile/profile_view.dart';
import 'bottomnavigationbar_viewmodel.dart';
import 'package:thuprai_clone/ui/views/home/home_view.dart';
import 'package:thuprai_clone/ui/views/cart/cart_view.dart';
import 'package:thuprai_clone/ui/views/login/login_view.dart';
import 'package:thuprai_clone/base/widgets/base_app_bar.dart';
import 'package:thuprai_clone/base/widgets/base_drawer.dart';

class BottomnavigationbarView
    extends StackedView<BottomnavigationbarViewModel> {
  const BottomnavigationbarView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BottomnavigationbarViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'thuprai',
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon:
                const Badge(label: Text('0'), child: Icon(Icons.shopping_cart)),
            onPressed: () {
              viewModel.navigateToCart();
            },
          ),
        ],
      ),
      drawer: const BaseDrawer(
        header: 'thuprai',
        title: 'Library',
        trailing: Icon(Icons.book),
      ),
      body: IndexedStack(
        index: viewModel.currentIndex,
        children: const [
          HomeView(),
          CartView(),
          LoginView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: BaseBottomNavigationBar(
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.setIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'My Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }

  @override
  BottomnavigationbarViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BottomnavigationbarViewModel();
}
