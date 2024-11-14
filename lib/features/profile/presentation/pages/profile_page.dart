import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/profile/presentation/pages/widgets/options_section.dart';
import 'package:online_store/features/profile/presentation/pages/widgets/profile_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Spacer(flex: 5),
          const ProfileSection(),
          const SizedBox(height: AppPadding.defaultSpaceWidget),
          const OptionsSection(),
          const SizedBox(height: AppPadding.defaultSpaceWidget / 2),
          _signOut(),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget _signOut() {
    return TextButton(
      child: Text(
        'Sign Out',
        style: AppTextStyle.textStyle18ExtraBold.copyWith(color: Colors.red),
      ),
      onPressed: () {},
    );
  }
}
