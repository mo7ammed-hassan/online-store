import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({super.key});

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
          const Text(
            'Gilbert Jones',
            style: AppTextStyle.textStyle18ExtraBold,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'gilbert.jones@example.com',
                style: AppTextStyle.textStyle16Medium.copyWith(color: Colors.grey),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Edit',
                  style: AppTextStyle.textStyle18Bold.copyWith(color: Colors.blue),
                ),
              ),
            ],
          ),
          Text(
            '121-224-7890',
            style: AppTextStyle.textStyle16.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}