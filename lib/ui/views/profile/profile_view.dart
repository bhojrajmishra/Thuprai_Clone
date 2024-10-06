import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/ui/common/ui_helpers.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: Image.network(
                viewModel.imageUrls,
                fit: BoxFit.cover,
              ),
            ),
            const Text(
              "Logget in as : ",
            ),
            verticalSpaceSmall,
            Text(
              " ${viewModel.getEmail}",
            ),
            verticalSpaceMedium,
            ListView.builder(
                shrinkWrap: true,
                itemCount: viewModel.list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: index == 0
                        ? const Icon(Icons.person)
                        : index == 1
                            ? const Icon(Icons.settings)
                            : const Icon(Icons.logout),
                    onTap: () => viewModel.ontapIndex(index),
                    title: Text(viewModel.list[index]),
                  );
                }),
          ],
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}
