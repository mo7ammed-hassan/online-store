import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_store/core/configs/assets/app_vectors.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Widget? title;
  final Widget? action;
  final bool hideBack;
  final VoidCallback arrowBacOnTap;

  const BasicAppBar({
    super.key,
    this.backgroundColor,
    this.title,
    this.action,
    this.hideBack = false,
    required this.arrowBacOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      titleSpacing: 12,
      title: title ?? const Text(''),
      scrolledUnderElevation: 0,
      actions: [
        action ?? Container(),
      ],
      leading: hideBack
          ? null
          : Row(
              children: [
                const SizedBox(
                  width: 10.0,
                ), // Adds fixed space before the leading icon
                Flexible(
                  child: GestureDetector(
                    onTap: arrowBacOnTap,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: AppColors.fillColorLightMode,
                        shape: BoxShape.circle,
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SvgPicture.asset(
                          AppVectors.arrowBack,
                          height: 20, // Set desired height
                          width: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
