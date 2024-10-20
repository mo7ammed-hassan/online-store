import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';

class BasicAppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? height;
  const BasicAppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(
          height ?? 50,
        ),
      ),
      child: Text(
        title,
        style: AppTextStyle.textStyle16Medium,
      ),
    );
  }
}
