import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_store/common/widgets/basic_app_button.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _signinText(),
              const SizedBox(height: 20),
              _emailField(),
              const SizedBox(height: 20),
              _continueButton(),
              const SizedBox(height: 20),
              _createAccount(context),
            ],
          ),
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

  TextField _emailField() {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Email Address',
      ),
    );
  }

  Widget _continueButton() {
    return BasicAppButton(
      title: 'Continue',
      onPressed: () {},
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Don\'t have an account? ',
            style: AppTextStyle.textStyle14,
          ),
          TextSpan(
            text: 'Create One',
            style:
                AppTextStyle.textStyle14.copyWith(fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // signup page
              },
          ),
        ],
      ),
    );
  }
}
