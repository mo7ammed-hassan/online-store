import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:online_store/common/widgets/button/basic_app_button.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/auth/data/models/user_creation_req_model.dart';
import 'package:online_store/features/auth/presentation/pages/gender_and_age_selection_page.dart';
import 'package:online_store/features/auth/presentation/pages/signin_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _firstNameCon = TextEditingController();

  final TextEditingController _lastNameCon = TextEditingController();

  final TextEditingController _emailCon = TextEditingController();

  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
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
    return TextField(
      controller: _firstNameCon,
      decoration: const InputDecoration(
        labelText: 'Firstname',
      ),
    );
  }

  TextField _lastNameField() {
    return TextField(
      controller: _lastNameCon,
      decoration: const InputDecoration(
        labelText: 'Lastname',
      ),
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

  TextField _passwordField() {
    return TextField(
      controller: _passwordCon,
      // obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      title: 'Continue',
      onPressed: () {
        context.push(
          GenderAndAgeSelectionPage(
            userCreationReq: UserCreationReqModel(
              firstName: _firstNameCon.text,
              lastName: _lastNameCon.text,
              email: _emailCon.text,
              password: _passwordCon.text,
            ),
          ),
        );
      },
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
