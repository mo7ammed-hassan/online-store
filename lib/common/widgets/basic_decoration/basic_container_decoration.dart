import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';

class BasicContainerDecoration extends StatelessWidget {
  final double? height;
  final Widget child;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  const BasicContainerDecoration({
    super.key,
    this.height = 63,
    required this.child,
    this.borderRadius = 100,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding ?? const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!),
        color: AppColors.fillColorLightMode,
      ),
      child: child,
    );
  }
}
