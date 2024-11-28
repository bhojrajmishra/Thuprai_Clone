import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/ui/views/detail/widgets/book_action_button.dart';
import 'package:thuprai_clone/ui/views/detail/widgets/book_author_list.dart';
import 'package:thuprai_clone/ui/views/detail/widgets/book_detail_appbar.dart';

import 'widgets/book_cover_section.dart';
import 'widgets/book_format_selector.dart';
import 'widgets/book_description.dart';

import 'detail_viewmodel.dart';

class DetailView extends StackedView<DetailViewModel> {
  final String slug;

  const DetailView({
    Key? key,
    required this.slug,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: BookDetailAppBar(
        title: viewModel.bookData?.nepaliTitle,
        onCartPressed: () {},
      ),
      backgroundColor: Colors.white,
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    BookCoverSection(bookData: viewModel.bookData),
                    const SizedBox(height: 16),
                    BookFormatSelector(
                      paperback: viewModel.bookData?.paperback,
                      ebook: viewModel.bookData?.ebook,
                    ),
                    BookDescription(
                      description: viewModel.bookData?.backCoverText,
                    ),
                    const Divider(),
                    BookAuthorsList(authors: viewModel.bookData?.authors),
                    const Divider(),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: BookActionButtons(
        onBuyNowPressed: () => debugPrint('Buy Now'),
        onAddToCartPressed: () {
          if (viewModel.bookData != null) {
            viewModel.addCart(
              viewModel.bookData!.id!,
              viewModel.bookData!.nepaliTitle!,
              viewModel.bookData!.frontCover!,
              viewModel.bookData!.paperback?.sellingPrice ?? 0,
            );
          }
        },
      ),
    );
  }

  @override
  DetailViewModel viewModelBuilder(BuildContext context) => DetailViewModel();

  @override
  void onViewModelReady(DetailViewModel viewModel) =>
      viewModel.fetchBookData(slug);
}
