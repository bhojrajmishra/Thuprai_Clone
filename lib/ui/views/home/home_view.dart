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
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: viewModel.getBooks,
        child: viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
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
                              color: const Color.fromARGB(154, 68, 171, 255),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 50.w),
                      _buildSection(
                        title: "New Releases",
                        listView: _buildBaseListView(
                          titles: viewModel.newReleaseTitles,
                          coverUrls: viewModel.newReleaseCoverUrls,
                          onTap: (index) => viewModel.onItemSelected(
                            viewModel.fetchData?.newReleases?[index].slug ?? '',
                          ),
                        ),
                      ),
                      _buildSection(
                        title: "Recent E-books",
                        listView: _buildBaseListView(
                          titles: viewModel.ebookTitles,
                          coverUrls: viewModel.ebookCoverUrls,
                          onTap: (index) => viewModel.onItemSelected(
                            viewModel.fetchData?.ebooks?[index].slug ?? '',
                          ),
                        ),
                      ),
                      _buildSection(
                        title: "Recent Audiobooks",
                        listView: _buildBaseListView(
                          titles: viewModel.audiobookTitles,
                          coverUrls: viewModel.audiobookCoverUrls,
                          onTap: (index) => viewModel.onItemSelected(
                            viewModel.fetchData?.audiobooks?[index].slug ?? '',
                          ),
                        ),
                      ),
                      _buildSection(
                        title: "Best Sellers",
                        listView: _buildBaseListView(
                          titles: viewModel.bestSellerTitles,
                          coverUrls: viewModel.bestSellerCoverUrls,
                          onTap: (index) => viewModel.onItemSelected(
                            viewModel.fetchData?.bestsellingEbooks?[index]
                                    .slug ??
                                '',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildSection({required String title, required Widget listView}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            BaseTextButton(
              text: 'View All',
              onPressed: () => debugPrint('View All clicked for $title'),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(height: 150, child: listView),
        verticalSpaceMedium,
      ],
    );
  }

  Widget _buildBaseListView({
    required List<String> titles,
    required List<String> coverUrls,
    required Function(int) onTap,
  }) {
    return BaseListView(
      title: titles,
      onTap: onTap,
      imageUrl: coverUrls,
      profiles: coverUrls,
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
