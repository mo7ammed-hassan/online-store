import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';

class SeeAllWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const SeeAllWidget({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyle.textStyle18Bold,
        ),
        GestureDetector(
          onTap: onTap,
          child: const Text('See All', style: AppTextStyle.textStyle16),
        ),
      ],
    );
  }
}
