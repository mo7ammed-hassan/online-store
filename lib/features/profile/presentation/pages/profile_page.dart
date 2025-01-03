import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/auth/domain/use_case/sign_out_use_case.dart';
import 'package:online_store/features/auth/presentation/pages/signin_page.dart';
import 'package:online_store/features/profile/presentation/cubit/get_user_cuit.dart';
import 'package:online_store/features/profile/presentation/pages/widgets/options_section.dart';
import 'package:online_store/features/profile/presentation/pages/widgets/profile_section.dart';
import 'package:online_store/service_locator.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUserCuit()..getUser(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.horizontalPagePadding,
            ),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const Spacer(flex: 3),
                      const ProfileSection(),
                      const SizedBox(height: AppPadding.defaultSpaceWidget),
                      const OptionsSection(),
                      const SizedBox(height: AppPadding.defaultSpaceWidget / 2),
                      _signOut(context),
                      const Spacer(flex: 2),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signOut(context) {
    return TextButton(
      child: Text(
        'Sign Out',
        style: AppTextStyle.textStyle18ExtraBold.copyWith(color: Colors.red),
      ),
      onPressed: () async {
        await getIt<SignOutUseCase>().call();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const SigninPage(),
          ),
          (route) => false,
        );
      },
    );
  }
}
