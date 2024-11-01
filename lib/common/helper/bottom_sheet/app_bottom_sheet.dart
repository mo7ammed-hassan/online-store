import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';

class AppBottomSheet {
  static Future<void> display(BuildContext context, Widget widget) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(23),
          topRight: Radius.circular(23),
        ),
      ),
      backgroundColor: AppColors.lightModeBackgroundColor,
      isDismissible: true,
      builder: (_) {
        return widget;
      },
      sheetAnimationStyle: AnimationStyle(
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.fastLinearToSlowEaseIn,
      ),
    );
  }
}
