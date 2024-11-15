import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/cubits/button/button_state.dart';
import 'package:online_store/common/cubits/button/button_state_cubit.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:online_store/common/widgets/button/basic_reactive_button.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/auth/data/models/user_signin_req_model.dart';
import 'package:online_store/features/auth/domain/use_case/signin_use_case.dart';
import 'package:online_store/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:online_store/features/main/presentation/page/main_page.dart';

class EnterPasswordPage extends StatefulWidget {
  final UserSigninReqModel signinReqModel;
  const EnterPasswordPage({super.key, required this.signinReqModel});

  @override
  State<EnterPasswordPage> createState() => _EnterPasswordPageState();
}

class _EnterPasswordPageState extends State<EnterPasswordPage> {
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        arrowBackOnTap: () {
          context.pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.verticalPagePadding,
          horizontal: AppPadding.horizontalPagePadding,
        ),
        child: BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonSuccessState) {
                context.pushAndremove(const MainPage());
              }

              if (state is ButtonFailureState) {
                var snackBar = SnackBar(
                  content: Text(state.message),
                  behavior: SnackBarBehavior.floating,
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _signinText(),
                const SizedBox(height: AppPadding.defaultSpaceWidget),
                _passwordField(),
                const SizedBox(height: AppPadding.defaultSpaceWidget),
                _continueButton(context),
                const SizedBox(height: AppPadding.defaultSpaceWidget),
                _forgotPassword(context),
              ],
            ),
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

  TextField _passwordField() {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(
        // because i use this widegt in the smae widget and when build this widget context build without provider so i use builder to rebuild context after bloc provider injected
        builder: (context) {
      return BasicReactiveButton(
        title: 'Continue',
        onPressed: () {
          widget.signinReqModel.password = _passwordCon.text;
          context.read<ButtonStateCubit>().execute(
                useCase: SigninUseCase(),
                params: widget.signinReqModel,
              );
        },
      );
    });
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
