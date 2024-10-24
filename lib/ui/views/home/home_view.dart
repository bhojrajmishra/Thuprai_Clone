import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/base/widgets/base_button.dart';
import 'package:thuprai_clone/base/widgets/base_carousel.dart';
import 'package:thuprai_clone/base/widgets/base_text_button.dart';
import 'package:thuprai_clone/constants/app_text_constants.dart';
import 'package:thuprai_clone/ui/common/ui_helpers.dart';
import 'package:thuprai_clone/theme/custom_theme.dart';
import 'package:thuprai_clone/ui/views/home/model/home_response_model.dart';
import 'package:thuprai_clone/ui/views/home/shimmer_wrapper/home_shimmer.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: viewModel.refreshBooks,
        child: viewModel.isBusy
            ? const Center(
                child: HomeShimmer(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCarousel(viewModel),
                      verticalSpaceMedium,
                      _buildFeaturedTitles(context, viewModel),
                      _buildSection(
                        context: context,
                        title: AppTextConstants.newReleaseTitle,
                        items: viewModel.homeData?.newReleases,
                        onViewAll: () => viewModel
                            .onViewAllTapped(AppTextConstants.newReleaseTitle),
                        onItemTap: viewModel.onItemSelected,
                      ),
                      _buildSection(
                        context: context,
                        title: AppTextConstants.recentEbook,
                        items: viewModel.homeData?.ebooks,
                        onViewAll: () => viewModel
                            .onViewAllTapped(AppTextConstants.recentEbook),
                        onItemTap: viewModel.onItemSelected,
                      ),
                      _buildSection(
                        context: context,
                        title: AppTextConstants.recentAudioBook,
                        items: viewModel.homeData?.audiobooks,
                        onViewAll: () => viewModel
                            .onViewAllTapped(AppTextConstants.recentAudioBook),
                        onItemTap: viewModel.onItemSelected,
                      ),
                      _buildSection(
                        context: context,
                        title: AppTextConstants.bestSeller,
                        items: viewModel.homeData?.bestsellingEbooks,
                        onViewAll: () => viewModel
                            .onViewAllTapped(AppTextConstants.bestSeller),
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
    final featuredItems = viewModel.homeData?.featured;
    if (featuredItems?.isNotEmpty ?? false) {
      return Center(
        child: BaseCarousel(
          imageUrls: featuredItems!.map((item) => item.image ?? '').toList(),
          onTap: viewModel.onCarouselItemTapped,
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildFeaturedTitles(BuildContext context, HomeViewModel viewModel) {
    final featuredItems = viewModel.homeData?.featured;
    if (featuredItems?.isNotEmpty ?? false) {
      return SizedBox(
        height: 80,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: featuredItems!.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(right: 8.0),
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
    return const SizedBox.shrink();
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
            const Spacer(),
            BaseTextButton(
              text: AppTextConstants.viewAll,
              onPressed: onViewAll,
              textStyle: TextStyle(
                color: CustomTheme.primary(context),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
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
                  margin: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.network(
                          item?.frontCover ?? '',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      const SizedBox(height: 5),
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

  @override
  void onViewModelReady(HomeViewModel viewModel) => viewModel.init();
}
