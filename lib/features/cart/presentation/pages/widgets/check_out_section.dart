import 'package:flutter/material.dart';
import 'package:online_store/common/widgets/button/basic_app_button.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/cart/domain/entity/cart_item_entity.dart';
import 'package:online_store/features/cart/presentation/pages/widgets/cart_order_details.dart';

class CheckOutSection extends StatelessWidget {
  final List<CartItemEntity> cartItems;
  const CheckOutSection({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         CartOrderDetails(cartItems: cartItems),
        const SizedBox(height: AppPadding.defaultSpaceWidget),
        BasicAppButton(title: 'CheckOut', onPressed: () {}),
      ],
    );
  }
}
