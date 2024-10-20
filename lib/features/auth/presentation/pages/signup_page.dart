import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/common/widgets/basic_app_bar.dart';
import 'package:online_store/common/widgets/basic_app_button.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/auth/presentation/pages/signin_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.verticalPagePadding,
          horizontal: AppPadding.horizontalPagePadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signupText(),
            const SizedBox(height: AppPadding.defaultSpaceWidget),
            _frirstNameField(),
            const SizedBox(height: AppPadding.defaultSpaceWidget),
            _lastNameField(),
            const SizedBox(height: AppPadding.defaultSpaceWidget),
            _emailField(),
            const SizedBox(height: AppPadding.defaultSpaceWidget),
            _passwordField(),
            const SizedBox(height: AppPadding.defaultSpaceWidget),
            _continueButton(context),
            const SizedBox(height: AppPadding.defaultSpaceWidget * 1.2),
            _haveAccount(context),
          ],
        ),
      ),
    );
  }

  Text _signupText() {
    return const Text(
      'Create Account',
      style: AppTextStyle.textStyle32,
    );
  }

  TextField _frirstNameField() {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Firstname',
      ),
    );
  }

  TextField _lastNameField() {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Lastname',
      ),
    );
  }

  TextField _emailField() {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Email Address',
      ),
    );
  }

  TextField _passwordField() {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Password',
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      title: 'Continue',
      onPressed: () {},
    );
  }

  Widget _haveAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Already have an account? ',
            style: AppTextStyle.textStyle15,
          ),
          TextSpan(
            text: 'Sigin',
            style:
                AppTextStyle.textStyle15.copyWith(fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacement(
                  const SigninPage(),
                );
              },
          ),
        ],
      ),
    );
  }
}
