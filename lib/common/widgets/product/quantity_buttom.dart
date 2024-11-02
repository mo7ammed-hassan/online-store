import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';

class QuantityButtom extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  final double? padding;
  final double? iconSize;
  const QuantityButtom({
    super.key,
    required this.icon,
    this.onPressed,
    this.padding,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding ?? 8),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
          child: Center(
            child: Icon(
              icon,
              size: iconSize ?? 28,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
