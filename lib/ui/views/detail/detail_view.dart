import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'detail_viewmodel.dart';

class DetailView extends StackedView<DetailViewModel> {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  DetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DetailViewModel();
}
