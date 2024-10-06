import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/base/validator/validator.dart';
import 'package:thuprai_clone/base/widgets/base_button.dart';
import 'package:thuprai_clone/base/widgets/base_gesture_detector.dart';
import 'package:thuprai_clone/base/widgets/base_horizontal_line.dart';
import 'package:thuprai_clone/base/widgets/base_text_button.dart';
import 'package:thuprai_clone/base/widgets/base_text_field.dart';
import 'package:thuprai_clone/ui/common/ui_helpers.dart';

import 'registration_viewmodel.dart';

class RegistrationView extends StackedView<RegistrationViewModel> {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RegistrationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Form(
        key: viewModel.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Hi there! Welcome to Thuprai',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                verticalSpaceLarge,
                BaseGestureDetector(
                  onPressed: viewModel.requestgoogleSignIn,
                  title: 'Sign-in with Google',
                  imageaddress:
                      'http://pngimg.com/uploads/google/google_PNG19635.png',
                ),
                const SizedBox(height: 10),
                BaseGestureDetector(
                  onPressed: viewModel.requestfacebookSignIn,
                  title: 'Sign-in with Facebook',
                  imageaddress:
                      'http://pngimg.com/uploads/facebook_logos/facebook_logos_PNG19754.png',
                ),
                const BaseHorizontalLine(
                  label: 'Or continue with email',
                  height: 100,
                ),
                BaseTextField(
                  controller: viewModel.fullNameController,
                  labelText: "Full Name",
                  obscureText: false,
                  validator: (value) => Validator.emailValidator(value),
                ),
                const SizedBox(height: 23),
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
                  obscureText: !viewModel.isPasswordVisible,
                  validator: (value) => Validator.passwordValidator(value),
                  suffixIcon: IconButton(
                    icon: Icon(
                      viewModel.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: viewModel.togglePasswordVisibility,
                  ),
                ),
                const SizedBox(height: 23),
                BaseButton(
                  text: 'Sign Up',
                  onPressed: () {
                    viewModel.requestRegisterApi();
                  },
                  color: const Color.fromARGB(255, 45, 88, 231),
                  width: double.infinity,
                ),
                Column(
                  children: [
                    SizedBox(height: 10),
                    Text("Already have an account?"),
                    SizedBox(height: 10),
                    BaseTextButton(
                      onPressed: viewModel.navigateToLogin,
                      text: 'Login here!',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  RegistrationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegistrationViewModel();
}
