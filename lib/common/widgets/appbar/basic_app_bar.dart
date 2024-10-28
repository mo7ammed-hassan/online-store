import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/core/configs/assets/app_vectors.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Widget? title;
  final Widget? action;
  final bool hideBack;

  const BasicAppBar({
    super.key,
    this.backgroundColor,
    this.title,
    this.action,
    this.hideBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: title ?? const Text(''),
      actions: [
        action ?? Container(),
      ],
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: AppColors.fillColorLightMode,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  fit: BoxFit.none,
                  AppVectors.arrowBack,
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
