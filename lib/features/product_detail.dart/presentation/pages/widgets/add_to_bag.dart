import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';

class AddToBag extends StatelessWidget {
  const AddToBag({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.horizontalPagePadding),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(
            60,
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${200}",
              style: AppTextStyle.textStyle16Bold,
            ),
            Text(
              'Add to Bag',
              style: AppTextStyle.textStyle16Bold,
            ),
          ],
        ),
      ),
    );
  }
}
