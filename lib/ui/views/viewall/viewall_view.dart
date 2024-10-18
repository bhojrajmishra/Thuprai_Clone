import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/ui/views/home/model/home_response_model.dart';
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
        title: Text(viewModel.title),
        actions: [
          IconButton(
            icon: Icon(viewModel.isGridView ? Icons.list : Icons.grid_view),
            onPressed: viewModel.toggleViewMode,
          ),
        ],
      ),
      body: viewModel.isBusy
          ? Center(child: CircularProgressIndicator())
          : viewModel.isGridView
              ? _buildGridView(viewModel)
              : _buildListView(viewModel),
    );
  }

  Widget _buildGridView(ViewallViewModel viewModel) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.7,
      ),
      itemCount: viewModel.items.length,
      itemBuilder: (context, index) {
        final item = viewModel.items[index] as dynamic;
        return GridTile(
          child: InkWell(
            onTap: () => viewModel.onItemSelected(item.slug ?? ''),
            child: Column(
              children: [
                Image.network(item.frontCover ?? '', height: 120),
                Text(item.title ?? '', textAlign: TextAlign.center),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildListView(ViewallViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.items.length,
      itemBuilder: (context, index) {
        final item = viewModel.items[index] as dynamic;
        return ListTile(
          leading: Image.network(item.frontCover ?? '', height: 50),
          title: Text(item.title ?? ''),
          onTap: () => viewModel.onItemSelected(item.slug ?? ''),
        );
      },
    );
  }

  @override
  ViewallViewModel viewModelBuilder(BuildContext context) => ViewallViewModel();

  @override
  void onViewModelReady(ViewallViewModel viewModel) => viewModel.init(title);
}
