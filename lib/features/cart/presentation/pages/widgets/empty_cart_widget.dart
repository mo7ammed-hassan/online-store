import 'package:flutter/material.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/common/widgets/button/basic_app_button.dart';
import 'package:online_store/core/configs/assets/app_images.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/all_categories/presentation/pages/all_categories_page.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.cartLogo),
          const SizedBox(height: AppPadding.defaultSpaceWidget + 5),
          const Text('Your Cart is Empty', style: AppTextStyle.textStyle24),
          const SizedBox(height: AppPadding.defaultSpaceWidget * 2),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.5,
            child: BasicAppButton(
              title: 'Explore Categories',
              onPressed: () {
                context.push(const AllCategoriesPage());
              },
            ),
          ),
        ],
      ),
    );
  }
}
