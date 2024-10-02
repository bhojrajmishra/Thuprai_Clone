import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/base/widgets/base_app_bar.dart';
import 'package:thuprai_clone/base/widgets/base_button.dart';
import 'package:thuprai_clone/base/widgets/base_divider.dart';
import 'package:thuprai_clone/base/widgets/base_list_tile.dart';
import 'package:thuprai_clone/base/widgets/base_outline_button.dart';
import 'package:thuprai_clone/ui/common/ui_helpers.dart';

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
      appBar: BaseAppBar(
        title: viewModel.bookData?.nepaliTitle ?? "Book Details",
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              viewModel.navigationToCart(
                viewModel.bookData?.id ?? 0,
                viewModel.bookData?.nepaliTitle ?? '',
                viewModel.bookData?.frontCover ?? '',
                viewModel.bookData?.paperback?.sellingPrice ?? 0,
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: 500,
                      height: 250,
                      decoration: const BoxDecoration(
                        color: Colors.white,
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
                              viewModel.bookData?.frontCover ?? '',
                              width: 150,
                              height: 200,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          horizontalSpaceMedium,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  viewModel.bookData?.nepaliTitle ?? '',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  viewModel.bookData?.authors
                                          ?.map((author) => author.name)
                                          .join(', ') ??
                                      '',
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(70, 33, 177, 243),
                                    shape: StadiumBorder(),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    viewModel.bookData?.categories?[0].name ??
                                        '',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpaceMedium,
                    BaseOutlineButton(
                      title: 'Paperback',
                      subtitle:
                          'Rs. ${viewModel.bookData?.paperback?.sellingPrice}',
                      onPressed: () {},
                    ),
                    horizontalSpaceMedium,
                    BaseOutlineButton(
                      title: 'Ebook',
                      subtitle:
                          'Rs. ${viewModel.bookData?.ebook?.sellingPrice}',
                      onPressed: () {},
                    ),
                    BaseListTile(
                      title: 'Description',
                      subtitle: viewModel.bookData?.backCoverText ?? '',
                    ),
                    const BaseDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: viewModel.bookData?.authors?.length ?? 0,
                            itemBuilder: (context, index) {
                              final auther =
                                  viewModel.bookData?.authors?[index];
                              return Row(
                                children: [
                                  Text(
                                    auther?.name ?? '',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  horizontalSpaceSmall,
                                  Text(
                                    auther?.name ?? '',
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const BaseDivider(),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BaseButton(
              width: 150,
              text: "Buy Now",
              onPressed: () {
                debugPrint('Buy now');

                viewModel.navigationToCart(
                  viewModel.bookData?.id ?? 0,
                  viewModel.bookData?.nepaliTitle ?? '',
                  viewModel.bookData?.frontCover ?? '',
                  viewModel.bookData?.paperback?.sellingPrice ?? 0,
                );
              },
              color: Colors.blue,
            ),
            horizontalSpaceMedium,
            BaseButton(
              width: 150,
              text: "Add to Cart",
              onPressed: () {
                viewModel.navigationToCart(
                  viewModel.bookData?.id ?? 0,
                  viewModel.bookData?.nepaliTitle ?? '',
                  viewModel.bookData?.frontCover ?? '',
                  viewModel.bookData?.paperback?.sellingPrice ?? 0,
                );
                debugPrint('Add to cart');
                debugPrint('Book id: ${viewModel.bookData?.id}');
                debugPrint('Book title: ${viewModel.bookData?.nepaliTitle}');
                debugPrint(
                    'Book front cover: ${viewModel.bookData?.frontCover}');
                debugPrint(
                    'Book price: ${viewModel.bookData?.paperback?.sellingPrice}');
              },
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  @override
  DetailViewModel viewModelBuilder(BuildContext context) => DetailViewModel();

  @override
  void onViewModelReady(DetailViewModel viewModel) =>
      viewModel.fetchBookData(slug);
}
