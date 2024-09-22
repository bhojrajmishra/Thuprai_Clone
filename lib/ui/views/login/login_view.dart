import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:thuprai_clone/base/validator/validator.dart';
import 'package:thuprai_clone/base/widgets/base_horizontal_line.dart';
import 'package:thuprai_clone/base/widgets/button.dart';
import 'package:thuprai_clone/base/widgets/base_app_bar.dart';
import 'package:thuprai_clone/base/widgets/base_drawer.dart';
import 'package:thuprai_clone/base/widgets/base_text_field.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @FormView(
    fields: [
      FormTextField(
        name: 'email',
        validator: Validator.emailValidator,
      ),
      FormTextField(
        name: 'password',
        validator: Validator.passwordValidator,
      ),
    ],
  )
  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar:
          BaseAppBar(title: 'thuprai', backgroundColor: Colors.white, actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
      ]),
      drawer: const BaseDrawer(
        title: 'thuprai',
      ),
      body: Form(
        key: viewModel.formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Please login to your account using"),
              const Icon(Icons.facebook),
              const BaseHorizontalLine(
                  label: 'Or continue with email', height: 100),
              BaseTextField(
                controller: viewModel.emailController,
                labelText: "Email",
                obscureText: false,
                validator: (value) => Validator.emailValidator(value),
              ),
              const SizedBox(height: 23),
              BaseTextField(
                controller: viewModel.passwordController,
                labelText: "Password",
                obscureText: true,
                validator: (value) => Validator.passwordValidator(value),
              ),
              Button(
                text: 'Continue',
                onPressed: viewModel.requestLoginApi,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
