import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';

class SelectAgeSection extends StatelessWidget {
  const SelectAgeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.horizontalPagePadding,
      ),
      decoration: BoxDecoration(
        color: AppColors.fillColorLightMode,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Age Range',
            style: AppTextStyle.textStyle16,
          ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}
