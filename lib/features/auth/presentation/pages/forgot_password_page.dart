import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/cubits/button/button_state.dart';
import 'package:online_store/common/cubits/button/button_state_cubit.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:online_store/common/widgets/button/basic_reactive_button.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/auth/domain/use_case/send_password_reset_email_use_case.dart';
import 'package:online_store/features/auth/presentation/pages/reset_password_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  BasicAppBar(arrowBacOnTap: () { context.pop(); },),
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.verticalPagePadding,
            horizontal: AppPadding.horizontalPagePadding,
          ),
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonSuccessState) {
                context.push(
                  const PasswordResetEmailPage(),
                );
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
                _forgotPasswordText(),
                const SizedBox(height: AppPadding.defaultSpaceWidget),
                _emailField(),
                const SizedBox(height: AppPadding.defaultSpaceWidget),
                _continueButton(),
                const SizedBox(height: AppPadding.defaultSpaceWidget),
              ],
            ),
          ),
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
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(
        labelText: 'Enter Email address',
      ),
    );
  }

  Widget _continueButton() {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        title: 'Continue',
        onPressed: () {
          context.read<ButtonStateCubit>().execute(
                params: _emailCon.text,
                useCase: SendPasswordResetEmailUseCase(),
              );
        },
      );
    });
  }
}
