import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/common/widgets/basic_app_bar.dart';
import 'package:online_store/common/widgets/basic_app_button.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/auth/presentation/pages/forgot_password_page.dart';

class EnterPasswordPage extends StatelessWidget {
  const EnterPasswordPage({super.key});

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
            _signinText(),
            const SizedBox(height: AppPadding.defaultSpaceWidget),
            _passwordField(),
            const SizedBox(height: AppPadding.defaultSpaceWidget),
            _continueButton(),
            const SizedBox(height: 20),
            _forgotPassword(context),
          ],
        ),
      ),
    );
  }

  Text _signinText() {
    return const Text(
      'Sign in',
      style: AppTextStyle.textStyle32,
    );
  }

  TextField _passwordField() {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Password',
      ),
    );
  }

  Widget _continueButton() {
    return BasicAppButton(
      title: 'Continue',
      onPressed: () {},
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Forgot Password? ',
            style: AppTextStyle.textStyle15,
          ),
          TextSpan(
            text: 'Reset',
            style:
                AppTextStyle.textStyle15.copyWith(fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.push(
                  const ForgotPasswordPage(),
                );
              },
          ),
        ],
      ),
    );
  }
}
