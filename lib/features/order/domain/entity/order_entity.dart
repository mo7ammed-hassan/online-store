// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:online_store/features/cart/domain/entity/cart_item_entity.dart';
import 'package:online_store/features/order/domain/entity/order_status_entity.dart';

class OrderEntity {
  final List<CartItemEntity> cartItems;
  final String createdDate;
  final int itemCount;
  final double totalPrice;
  final String shippingAddress;
  final String orderNumber;
  final List<OrderStatusEntity> orderStatus;

  OrderEntity({
    required this.cartItems,
    required this.createdDate,
    required this.itemCount,
    required this.totalPrice,
    required this.shippingAddress,
    required this.orderNumber,
    required this.orderStatus,
  });
}
