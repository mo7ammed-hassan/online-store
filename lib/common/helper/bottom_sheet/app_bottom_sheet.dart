import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';

class AppBottomSheet {
  static Future<void> display(BuildContext context, Widget widget) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      backgroundColor: AppColors.lightModeBackgroundColor,
      isDismissible: true,
      builder: (_) {
        return widget;
      },
    );
  }
}
