import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/ui/views/home/components/featured_section.dart';
import 'package:thuprai_clone/ui/views/home/components/book_section.dart';
import 'package:thuprai_clone/constants/app_text_constants.dart';
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
            ? const Center(child: HomeShimmer())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FeaturedSection(
                        featuredItems: viewModel.homeData?.featured ?? [],
                        onCarouselTap: viewModel.onCarouselItemTapped,
                        onItemTap: viewModel.onItemSelected,
                      ),
                      BookSection(
                        title: AppTextConstants.newReleaseTitle,
                        items: viewModel.homeData?.newReleases ?? [],
                        onViewAll: () => viewModel
                            .onViewAllTapped(AppTextConstants.newReleaseTitle),
                        onItemTap: viewModel.onItemSelected,
                      ),
                      BookSection(
                        title: AppTextConstants.recentEbook,
                        items: viewModel.homeData?.ebooks ?? [],
                        onViewAll: () => viewModel
                            .onViewAllTapped(AppTextConstants.recentEbook),
                        onItemTap: viewModel.onItemSelected,
                      ),
                      BookSection(
                        title: AppTextConstants.recentAudioBook,
                        items: viewModel.homeData?.audiobooks ?? [],
                        onViewAll: () => viewModel
                            .onViewAllTapped(AppTextConstants.recentAudioBook),
                        onItemTap: viewModel.onItemSelected,
                      ),
                      BookSection(
                        title: AppTextConstants.bestSeller,
                        items: viewModel.homeData?.bestsellingEbooks ?? [],
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

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) => viewModel.init();
}
