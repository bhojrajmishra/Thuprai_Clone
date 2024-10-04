import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'viewall_viewmodel.dart';

class ViewallView extends StackedView<ViewallViewModel> {
  final String title;
  const ViewallView({Key? key, required this.title}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ViewallViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(viewModel.isGridView ? Icons.list : Icons.grid_view),
            onPressed: viewModel.toggleViewMode,
          ),
        ],
      ),
      body: viewModel.isGridView
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.7,
              ),
              itemCount: viewModel.coverUrls.length,
              itemBuilder: (context, index) {
                return GridTile(
                  child: Column(
                    children: [
                      Image.network(viewModel.coverUrls[index], height: 120),
                      Text(viewModel.titles[index],
                          textAlign: TextAlign.center),
                    ],
                  ),
                );
              },
            )
          : ListView.builder(
              itemCount: viewModel.coverUrls.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading:
                      Image.network(viewModel.coverUrls[index], height: 50),
                  title: Text(viewModel.titles[index]),
                );
              },
            ),
    );
  }

  @override
  ViewallViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ViewallViewModel();
}
