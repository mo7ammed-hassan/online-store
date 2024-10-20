import 'package:flutter/material.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/common/widgets/basic_app_button.dart';
import 'package:online_store/core/configs/assets/app_images.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/auth/presentation/pages/signin_page.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.verticalPagePadding,
          horizontal: AppPadding.horizontalPagePadding,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.resetLogo),
              const SizedBox(height: AppPadding.defaultSpaceWidget),
              _returnText(),
              const SizedBox(height: AppPadding.defaultSpaceWidget),
              returnLoginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Text _returnText() {
    return const Text(
      'We Sent you an Email to reset your password.',
      style: AppTextStyle.textStyle24Medium,
      textAlign: TextAlign.center,
    );
  }

  Widget returnLoginButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).height * 0.2,
      child: BasicAppButton(
        title: 'Return to Login',
        onPressed: () {
          context.pushReplacement(const SigninPage());
        },
      ),
    );
  }
}
