import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_store/core/configs/assets/app_vectors.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _profileImage(),
        _gender(),
        _bag(),
      ],
    );
  }

  Widget _profileImage() {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: AppColors.fillColorLightMode,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _gender() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.fillColorLightMode,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          const FittedBox(
            child: Text(
              'Men',
              style: AppTextStyle.textStyle16Bold,
            ),
          ),
          const SizedBox(width: 12),
          SvgPicture.asset(
            AppVectors.arrowDown,
          ),
        ],
      ),
    );
  }

  Widget _bag() {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        AppVectors.bagVector,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
