import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/base/validator/validator.dart';
import 'package:thuprai_clone/base/widgets/base_gesture_detector.dart';
import 'package:thuprai_clone/base/widgets/base_horizontal_line.dart';
import 'package:thuprai_clone/base/widgets/base_text_button.dart';
import 'package:thuprai_clone/base/widgets/base_text_field.dart';
import 'package:thuprai_clone/base/widgets/button.dart';
import 'package:thuprai_clone/base/widgets/base_app_bar.dart';
import 'package:thuprai_clone/base/widgets/base_drawer.dart';
import 'package:thuprai_clone/base/widgets/base_bottom_navigation_bar.dart';
import 'package:thuprai_clone/ui/common/ui_helpers.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(
        title: 'thuprai',
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
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
                Button(
                  text: 'Continue',
                  onPressed: viewModel.requestLoginApi,
                ),
                Row(
                  children: [
                    BaseTextButton(
                      onPressed: viewModel.navigateToHome,
                      text: 'Forgot Password?',
                    ),
                    const Spacer(),
                    BaseTextButton(
                      onPressed: viewModel.navigateToHome,
                      text: 'Sign Up',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BaseBottomNavigationBar(
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'My library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
