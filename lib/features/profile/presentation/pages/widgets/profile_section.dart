import 'package:flutter/material.dart';
import 'package:online_store/core/configs/assets/app_images.dart';
import 'package:online_store/features/profile/presentation/pages/widgets/user_info_card.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _profileImage(),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
        const UserInfoCard(),
      ],
    );
  }

  Widget _profileImage() {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(AppImages.appLogo),
        ),
      ),
    );
  }
}
