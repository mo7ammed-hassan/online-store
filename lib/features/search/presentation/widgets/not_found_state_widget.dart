import 'package:flutter/material.dart';
import 'package:online_store/common/widgets/button/basic_app_button.dart';
import 'package:online_store/core/configs/assets/app_images.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';

class NotFoundStateWidget extends StatelessWidget {
  const NotFoundStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(
          flex: 2,
        ),
        Image.asset(AppImages.searchFilter),
        const SizedBox(height: AppPadding.defaultSpaceWidget),
        const Text(
          'Sorry, we couldn\'t find any matching result for your Search.',
          style: AppTextStyle.textStyle24Medium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppPadding.verticalPagePadding),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.55,
          child: BasicAppButton(
            title: 'Explore Categories',
            onPressed: () {},
          ),
        ),
        const Spacer(
          flex: 4,
        ),
      ],
    );
  }
}
