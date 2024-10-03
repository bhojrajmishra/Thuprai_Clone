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
      body: Center(
        child: Text('ViewallView'),
      ),
    );
  }

  @override
  ViewallViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ViewallViewModel();
}
