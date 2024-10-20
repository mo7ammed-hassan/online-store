import 'package:flutter/material.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/common/widgets/basic_app_bar.dart';
import 'package:online_store/common/widgets/basic_app_button.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/auth/presentation/pages/reset_password_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

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
            _forgotPasswordText(),
            const SizedBox(height: AppPadding.defaultSpaceWidget),
            _emailField(),
            const SizedBox(height: AppPadding.defaultSpaceWidget),
            _continueButton(context),
            const SizedBox(height: AppPadding.defaultSpaceWidget),
          ],
        ),
      ),
    );
  }

  Text _forgotPasswordText() {
    return const Text(
      'Forgot Password',
      style: AppTextStyle.textStyle32,
    );
  }

  TextField _emailField() {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Enter Email address',
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      title: 'Continue',
      onPressed: () {
        context.pushReplacement(const ResetPage());
      },
    );
  }
}
