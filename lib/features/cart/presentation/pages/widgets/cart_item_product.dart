import 'package:flutter/material.dart';
import 'package:online_store/common/widgets/product/quantity_buttom.dart';
import 'package:online_store/core/configs/assets/app_images.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key});
  //final CartItemEntity cartItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.fillColorLightMode,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Product Image
          Expanded(
            flex: 2,
            child: Image.asset(AppImages.appLogo),
          ),
          const SizedBox(width: 18),
          // Product Details
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Tile', style: AppTextStyle.textStyle18Bold),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text.rich(
                      overflow: TextOverflow.ellipsis,
                      TextSpan(
                        text: 'Size - ',
                        style: AppTextStyle.textStyle16
                            .copyWith(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: '36',
                            style: AppTextStyle.textStyle16Bold
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text.rich(
                      overflow: TextOverflow.ellipsis,
                      TextSpan(
                        text: 'Color - ',
                        style: AppTextStyle.textStyle16
                            .copyWith(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: 'Red',
                            style: AppTextStyle.textStyle16Bold
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Quantity & Price
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('\$150', style: AppTextStyle.textStyle18Bold),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    QuantityButtom(
                      padding: 0,
                      iconSize: 25,
                      icon: Icons.add,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 12),
                    QuantityButtom(
                      padding: 0,
                      iconSize: 25,
                      icon: Icons.remove,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}