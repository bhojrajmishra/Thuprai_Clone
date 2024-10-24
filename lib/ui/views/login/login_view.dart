import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/base/validator/validator.dart';
import 'package:thuprai_clone/base/widgets/base_button.dart';
import 'package:thuprai_clone/base/widgets/base_gesture_detector.dart';
import 'package:thuprai_clone/base/widgets/base_horizontal_line.dart';
import 'package:thuprai_clone/base/widgets/base_text_button.dart';
import 'package:thuprai_clone/base/widgets/base_text_field.dart';
import 'package:thuprai_clone/constants/app_text_constants.dart';
import 'package:thuprai_clone/constants/constats_links.dart';
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
      body: Form(
        key: viewModel.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  AppTextConstants.pleaseLogin,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                verticalSpaceLarge,
                BaseGestureDetector(
                  onPressed: viewModel.requestgoogleSignIn,
                  title: AppTextConstants.signWithGoogle,
                  imageaddress: ConstatsLinks.GoogleUrl,
                ),
                const SizedBox(height: 10),
                BaseGestureDetector(
                  onPressed: viewModel.requestfacebookSignIn,
                  title: AppTextConstants.signWithFacebok,
                  imageaddress: ConstatsLinks.FacebookUrl,
                ),
                const BaseHorizontalLine(
                  label: AppTextConstants.labelTextForDivider,
                  height: 100,
                ),
                BaseTextField(
                  controller: viewModel.emailController,
                  labelText: AppTextConstants.labelTextForEmail,
                  obscureText: false,
                  validator: (value) => Validator.emailValidator(value),
                ),
                const SizedBox(height: 23),
                BaseTextField(
                  controller: viewModel.passwordController,
                  labelText: AppTextConstants.labelTextForPassword,
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
                  text: AppTextConstants.procced,
                  onPressed: viewModel.requestLoginApi,
                  color: const Color.fromARGB(255, 45, 88, 231),
                  width: double.infinity,
                ),
                Row(
                  children: [
                    BaseTextButton(
                      onPressed: viewModel.navigateToHome,
                      text: AppTextConstants.forgetPasswordd,
                    ),
                    const Spacer(),
                    BaseTextButton(
                      onPressed: viewModel.navigateToSignUp,
                      text: AppTextConstants.signUp,
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
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
