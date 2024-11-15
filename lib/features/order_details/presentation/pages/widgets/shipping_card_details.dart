import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';

class ShippingDetailsCard extends StatelessWidget {
  const ShippingDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: AppColors.fillColorLightMode,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '2715 Ash Dr. San Jose, South Dakota 83475',
            style: AppTextStyle.textStyle16,
          ),
          SizedBox(height: 10),
          Text(
            '121-224-7890',
            style: AppTextStyle.textStyle16,
          ),
        ],
      ),
    );
  }
}