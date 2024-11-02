import 'package:flutter/material.dart';
import 'package:online_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/cart/presentation/pages/widgets/cart_item_product.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(
        hideBack: false,
        title: Text(
          'Cart',
          style: AppTextStyle.textStyle24Bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.horizontalPagePadding,
        ),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Remove All',
                style: AppTextStyle.textStyle18Bold,
              ),
            ),
            const SizedBox(height: AppPadding.defaultSpaceWidget),
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                itemBuilder: (context, index) => const CartItemCard(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


