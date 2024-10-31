import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';

class SelectionOptionCard extends StatelessWidget {
  final bool isSelected;
  final Function()? onTap;
  const SelectionOptionCard({super.key, required this.isSelected, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.linear,
        margin: const EdgeInsets.only(top: 14),
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: AppPadding.horizontalPagePadding * 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.fillColorLightMode,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Option ${0}',
              style: isSelected
                  ? AppTextStyle.textStyle16Medium.copyWith(color: Colors.white)
                  : AppTextStyle.textStyle16Medium,
            ),
            isSelected
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
