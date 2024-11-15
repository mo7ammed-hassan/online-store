import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:online_store/common/widgets/button/basic_app_button.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/auth/data/models/user_signin_req_model.dart';
import 'package:online_store/features/auth/presentation/pages/enter_password_page.dart';
import 'package:online_store/features/auth/presentation/pages/signup_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        arrowBackOnTap: () {
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.verticalPagePadding,
          horizontal: AppPadding.horizontalPagePadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signinText(),
            const SizedBox(height: AppPadding.defaultSpaceWidget),
            _emailField(),
            const SizedBox(height: AppPadding.defaultSpaceWidget),
            _continueButton(context),
            const SizedBox(height: AppPadding.defaultSpaceWidget),
            _createAccount(context),
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

  TextField _emailField() {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(
        labelText: 'Email Address',
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      title: 'Continue',
      onPressed: () {
        context.push(
          EnterPasswordPage(
            signinReqModel: UserSigninReqModel(
              email: _emailCon.text,
            ),
          ),
        );
      },
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Don\'t have an account? ',
            style: AppTextStyle.textStyle15,
          ),
          TextSpan(
            text: 'Create One',
            style:
                AppTextStyle.textStyle15.copyWith(fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.push(
                  const SignupPage(),
                );
              },
          ),
        ],
      ),
    );
  }
}
