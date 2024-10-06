import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/base/widgets/base_button.dart';
import 'package:thuprai_clone/base/widgets/base_carousel.dart';
import 'package:thuprai_clone/base/widgets/base_list_view_builder.dart';
import 'package:thuprai_clone/base/widgets/base_text_button.dart';
import 'package:thuprai_clone/ui/common/ui_helpers.dart';
import 'package:thuprai_clone/theme/custom_theme.dart';
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
      body: RefreshIndicator(
        onRefresh: viewModel.getBooks,
        child: viewModel.isBusy
            ? Center(
                child: CircularProgressIndicator(
                    color: CustomTheme.primary(context)))
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (viewModel.featuredImageUrls.isNotEmpty)
                        Center(
                          child: BaseCarousel(
                            imageUrls: viewModel.featuredImageUrls,
                            onTap: viewModel.onCarouselItemTapped,
                          ),
                        ),
                      verticalSpaceMedium,
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: viewModel.featuredTitles.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: BaseButton(
                              text: viewModel.featuredTitles[index],
                              onPressed: () => viewModel.onItemSelected(
                                viewModel.fetchData?.featured?[index].slug ??
                                    '',
                              ),
                              color: CustomTheme.primary(context),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 50.w),
                      _buildSection(
                        context: context,
                        title: "New Releases",
                        listView: _buildBaseListView(
                          context: context,
                          titles: viewModel.newReleaseTitles,
                          coverUrls: viewModel.newReleaseCoverUrls,
                          onTap: (index) => viewModel.onItemSelected(
                            viewModel.fetchData?.newReleases?[index].slug ?? '',
                          ),
                        ),
                        onViewAll: () =>
                            viewModel.onViewAllTapped("New Releases"),
                      ),
                      _buildSection(
                        context: context,
                        title: "Recent E-books",
                        listView: _buildBaseListView(
                          context: context,
                          titles: viewModel.ebookTitles,
                          coverUrls: viewModel.ebookCoverUrls,
                          onTap: (index) => viewModel.onItemSelected(
                            viewModel.fetchData?.ebooks?[index].slug ?? '',
                          ),
                        ),
                        onViewAll: () =>
                            viewModel.onViewAllTapped("Recent E-books"),
                      ),
                      _buildSection(
                        context: context,
                        title: "Recent Audiobooks",
                        listView: _buildBaseListView(
                          context: context,
                          titles: viewModel.audiobookTitles,
                          coverUrls: viewModel.audiobookCoverUrls,
                          onTap: (index) => viewModel.onItemSelected(
                            viewModel.fetchData?.audiobooks?[index].slug ?? '',
                          ),
                        ),
                        onViewAll: () =>
                            viewModel.onViewAllTapped("Recent Audiobooks"),
                      ),
                      _buildSection(
                        context: context,
                        title: "Best Sellers",
                        listView: _buildBaseListView(
                          context: context,
                          titles: viewModel.bestSellerTitles,
                          coverUrls: viewModel.bestSellerCoverUrls,
                          onTap: (index) => viewModel.onItemSelected(
                            viewModel.fetchData?.bestsellingEbooks?[index]
                                    .slug ??
                                '',
                          ),
                        ),
                        onViewAll: () =>
                            viewModel.onViewAllTapped("Best Sellers"),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildSection({
    required BuildContext context,
    required String title,
    required Widget listView,
    required VoidCallback onViewAll,
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
                text: 'View All',
                onPressed: onViewAll,
                textStyle: TextStyle(
                  color: CustomTheme.primary(context),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(height: 150, child: listView),
        verticalSpaceMedium,
      ],
    );
  }

  Widget _buildBaseListView({
    required BuildContext context,
    required List<String> titles,
    required List<String> coverUrls,
    required Function(int) onTap,
  }) {
    return BaseListView(
      titles: titles,
      onTap: onTap,
      imageUrls: coverUrls,
      profiles: coverUrls,
      titleStyle: CustomTheme.bodyLarge(context)?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
