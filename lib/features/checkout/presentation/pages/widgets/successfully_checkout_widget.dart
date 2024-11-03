import 'package:flutter/material.dart';
import 'package:online_store/common/widgets/button/basic_app_button.dart';
import 'package:online_store/core/configs/assets/app_images.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';

class SuccessfullyCheckoutWidget extends StatelessWidget {
  const SuccessfullyCheckoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.checkoutLogo),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    'Order Placed\n Successfully',
                    style: AppTextStyle.textStyle32,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppPadding.defaultSpaceWidget),
                  Text(
                    'You will recieve an email confirmation',
                    style:
                        AppTextStyle.textStyle15.copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(flex: 3),
                  BasicAppButton(
                    title: 'See Order details',
                    onPressed: () {},
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
