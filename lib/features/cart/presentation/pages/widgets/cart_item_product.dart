import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_store/common/helper/images/image_display.dart';
import 'package:online_store/common/widgets/product/quantity_buttom.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/features/cart/domain/entity/cart_item_entity.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.cartItem});
  final CartItemEntity cartItem;
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                placeholder: (context, url) {
                  return const SizedBox(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
                imageUrl: ImageDisplayHelper.generateProductImageURL(
                  cartItem.productImage,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Product Details
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    cartItem.productTitle,
                    style: AppTextStyle.textStyle18Bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text.rich(
                        overflow: TextOverflow.ellipsis,
                        TextSpan(
                          text: 'Size - ',
                          style: AppTextStyle.textStyle16
                              .copyWith(color: Colors.grey),
                          children: [
                            TextSpan(
                              text: cartItem.productSize,
                              style: AppTextStyle.textStyle16Bold
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text.rich(
                        softWrap: false,
                        TextSpan(
                          text: 'Color - ',
                          style: AppTextStyle.textStyle16
                              .copyWith(color: Colors.grey),
                          children: [
                            TextSpan(
                              text: cartItem.productColor,
                              style: AppTextStyle.textStyle16Bold
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        ),
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
                FittedBox(
                  child: Text(
                    '\$${cartItem.productPrice}',
                    style: AppTextStyle.textStyle18Bold,
                  ),
                ),
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
