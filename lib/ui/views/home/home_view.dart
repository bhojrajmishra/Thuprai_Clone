import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/base/widgets/base_button.dart';
import 'package:thuprai_clone/base/widgets/base_carousel.dart';
import 'package:thuprai_clone/base/widgets/base_text_button.dart';
import 'package:thuprai_clone/ui/common/ui_helpers.dart';
import 'package:thuprai_clone/theme/custom_theme.dart';
import 'package:thuprai_clone/ui/views/home/model/home_response_model.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: viewModel.refreshBooks,
        child: viewModel.isBusy
            ? Center(
                child: CircularProgressIndicator(
                    color: CustomTheme.primary(context)))
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCarousel(viewModel),
                      verticalSpaceMedium,
                      _buildFeaturedTitles(context, viewModel),
                      _buildSection(
                        context: context,
                        title: "New Releases",
                        items: viewModel.homeData.newReleases,
                        onViewAll: () =>
                            viewModel.onViewAllTapped("New Releases"),
                        onItemTap: viewModel.onItemSelected,
                      ),
                      _buildSection(
                        context: context,
                        title: "Recent E-books",
                        items: viewModel.homeData.ebooks,
                        onViewAll: () =>
                            viewModel.onViewAllTapped("Recent E-books"),
                        onItemTap: viewModel.onItemSelected,
                      ),
                      _buildSection(
                        context: context,
                        title: "Recent Audiobooks",
                        items: viewModel.homeData.audiobooks,
                        onViewAll: () =>
                            viewModel.onViewAllTapped("Recent Audiobooks"),
                        onItemTap: viewModel.onItemSelected,
                      ),
                      _buildSection(
                        context: context,
                        title: "Best Sellers",
                        items: viewModel.homeData.bestsellingEbooks,
                        onViewAll: () =>
                            viewModel.onViewAllTapped("Best Sellers"),
                        onItemTap: viewModel.onItemSelected,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildCarousel(HomeViewModel viewModel) {
    final featuredItems = viewModel.homeData.featured;
    if (featuredItems?.isNotEmpty ?? false) {
      return Center(
        child: BaseCarousel(
          imageUrls: featuredItems!.map((item) => item.image ?? '').toList(),
          onTap: viewModel.onCarouselItemTapped,
        ),
      );
    }
    return SizedBox.shrink();
  }

  Widget _buildFeaturedTitles(BuildContext context, HomeViewModel viewModel) {
    final featuredItems = viewModel.homeData.featured;
    if (featuredItems?.isNotEmpty ?? false) {
      return SizedBox(
        height: 80,
        child: ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: featuredItems!.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: BaseButton(
              text: featuredItems[index].title ?? '',
              onPressed: () =>
                  viewModel.onItemSelected(featuredItems[index].slug ?? ''),
              color: CustomTheme.primary(context),
            ),
          ),
        ),
      );
    }
    return SizedBox.shrink();
  }

  Widget _buildSection({
    required BuildContext context,
    required String title,
    required List<Audiobook>? items,
    required VoidCallback onViewAll,
    required Function(String) onItemTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: CustomTheme.displayLarge(context)?.copyWith(fontSize: 18),
            ),
            Spacer(),
            BaseTextButton(
              text: 'View All',
              onPressed: onViewAll,
              textStyle: TextStyle(
                color: CustomTheme.primary(context),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items?.length ?? 0,
            itemBuilder: (context, index) {
              final item = items?[index];
              return GestureDetector(
                onTap: () => onItemTap(item?.slug ?? ''),
                child: Container(
                  width: 100,
                  margin: EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.network(
                          item?.frontCover ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        item?.title ?? '',
                        style: CustomTheme.bodyLarge(context)?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        verticalSpaceMedium,
      ],
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
