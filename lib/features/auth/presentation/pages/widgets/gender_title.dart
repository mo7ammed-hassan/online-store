import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';

class GenderTitle extends StatelessWidget {
  final String gender;
  final int genderIndex;
  const GenderTitle({
    super.key,
    required this.gender,
    required this.genderIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              gender,
              style: AppTextStyle.textStyle17,
            ),
          ),
        ),
      ),
    );
  }
}
