import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';

class CartOrderDatailsCard extends StatelessWidget {
  final String title;
  final String value;
  const CartOrderDatailsCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.textStyle18.copyWith(color: Colors.grey),
          ),
          Text(
            '\$$value',
            style: AppTextStyle.textStyle18Bold,
          ),
        ],
      ),
    );
  }
}
