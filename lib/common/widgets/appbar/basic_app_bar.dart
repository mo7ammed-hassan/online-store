import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_store/core/configs/assets/app_vectors.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Widget? title;
  final Widget? action;
  final bool hideBack;
  final VoidCallback? arrowBackOnTap;

  const BasicAppBar({
    super.key,
    this.backgroundColor,
    this.title,
    this.action,
    this.hideBack = false,
    this.arrowBackOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      titleSpacing: 0,
      title: title ?? const Text(''),
      scrolledUnderElevation: 0,
      actions: [
        action ?? const SizedBox.shrink(),
      ],
      leading: hideBack
          ? null
          : Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: GestureDetector(
                onTap: arrowBackOnTap,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: AppColors.fillColorLightMode,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppVectors.arrowBack,
                      width: 16,
                      height: 16,
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
