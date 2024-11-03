import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/cart/domain/entity/cart_item_entity.dart';
import 'package:online_store/features/cart/presentation/pages/widgets/cart_item_card.dart';
import 'package:online_store/features/cart/presentation/pages/widgets/check_out_section.dart';

class CartProducts extends StatelessWidget {
  final List<CartItemEntity> cartProducts;
  const CartProducts({
    super.key,
    required this.cartProducts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            itemCount: cartProducts.length,
            itemBuilder: (context, index) => CartItemCard(
              cartItem: cartProducts[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 12),
          ),
        ),
        const SizedBox(height: 12),
        CheckOutSection(cartItems: cartProducts),
        const SizedBox(height: 5),
      ],
    );
  }
}
