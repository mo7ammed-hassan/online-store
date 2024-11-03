import 'package:flutter/material.dart';
import 'package:online_store/common/helper/cart/cart_helper.dart';
import 'package:online_store/features/cart/domain/entity/cart_item_entity.dart';
import 'package:online_store/features/cart/presentation/pages/widgets/cart_order_details_card.dart';

class CartOrderDetails extends StatelessWidget {
  final List<CartItemEntity> cartItems;
  const CartOrderDetails({
    super.key,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartOrderDatailsCard(
          title: 'SubTotal',
          value: CartHelper.calculateCartSubTotal(cartItems).toString(),
        ),
        const CartOrderDatailsCard(
          title: 'Shipping Cost',
          value: '8',
        ),
        const CartOrderDatailsCard(
          title: 'Tax',
          value: '0',
        ),
        CartOrderDatailsCard(
          title: 'Total',
          value:
              (CartHelper.calculateCartSubTotal(cartItems) + 8 + 0).toString(),
        ),
      ],
    );
  }
}
