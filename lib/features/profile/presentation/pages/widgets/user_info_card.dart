import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/features/auth/domain/entities/current_user_entity.dart';

class UserInfoCard extends StatelessWidget {
  final CurrentUserEntity user;
  const UserInfoCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.fillColorLightMode,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${user.firstName} ${user.lastName}',
            style: AppTextStyle.textStyle18ExtraBold,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                user.email,
                style:
                    AppTextStyle.textStyle16Medium.copyWith(color: Colors.grey),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Edit',
                  style:
                      AppTextStyle.textStyle18Bold.copyWith(color: Colors.blue),
                ),
              ),
            ],
          ),
          Text(
            user.gender == 1 ? 'Male' : 'Female',
            style: AppTextStyle.textStyle16.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
