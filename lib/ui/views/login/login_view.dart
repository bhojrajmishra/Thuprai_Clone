import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:thuprai_clone/base/widgets/button.dart';
import 'package:thuprai_clone/base/widgets/custom_text_field.dart';
import 'package:thuprai_clone/base/widgets/validator/validator.dart';

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
        body: Form(
      key: viewModel.formKey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100, width: 100),
            CustomTextFormField(
              controller: viewModel.emailController,
              labelText: "Email",
              obscureText: false,
              validator: (value) => Validator.emailValidator(value),
            ),
            const SizedBox(height: 23),
            CustomTextFormField(
              controller: viewModel.passwordController,
              labelText: "Password",
              obscureText: true,
              validator: (value) => Validator.passwordValidator(value),
            ),
            Button(
              text: 'Continue',
              onPressed: viewModel.requestLoginApi,
            )
          ],
        ),
      ),
    ));
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
