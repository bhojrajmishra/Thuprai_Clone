import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:thuprai_clone/base/validator/validator.dart';
import 'package:thuprai_clone/base/widgets/base_gesture_detector.dart';
import 'package:thuprai_clone/base/widgets/base_horizontal_line.dart';
import 'package:thuprai_clone/base/widgets/base_text_button.dart';
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
      backgroundColor: Colors.white,
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
      drawer: const BaseDrawer(title: 'thuprai'),
      body: Form(
        key: viewModel.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Please login to your account using',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 50),
                BaseGestureDetector(
                    onPressed: viewModel.requestgoogleSignIn,
                    title: 'Sign-in with Google',
                    imageaddress:
                        'http://pngimg.com/uploads/google/google_PNG19635.png'),
                const SizedBox(height: 10),
                BaseGestureDetector(
                    onPressed: viewModel.requestfacebookSignIn,
                    title: 'Sign-in with Facebook',
                    imageaddress:
                        'http://pngimg.com/uploads/facebook_logos/facebook_logos_PNG19754.png'),
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
                Row(
                  children: [
                    BaseTextButton(
                        onPressed: viewModel.navigateToHome,
                        text: 'Forgot Password?'),
                    const Spacer(),
                    BaseTextButton(
                        onPressed: viewModel.navigateToHome, text: 'Sign Up'),
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
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
