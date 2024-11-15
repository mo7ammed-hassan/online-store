// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:online_store/features/cart/data/models/cart_item_model.dart';
import 'package:online_store/features/cart/domain/entity/cart_item_entity.dart';
import 'package:online_store/features/order/data/models/order_status_model.dart';
import 'package:online_store/features/order/domain/entity/order_status_entity.dart';

class OrderRegistrationReqModel {
  final List<CartItemEntity> cartItems;
  final String createdDate;
  final int itemCount;
  final double totalPrice;
  final String shippingAddress;
  final String orderNumber;
  final List<OrderStatusEntity> orderStatus;

  OrderRegistrationReqModel({
    required this.cartItems,
    required this.createdDate,
    required this.itemCount,
    required this.totalPrice,
    required this.shippingAddress,
    required this.orderNumber,
    required this.orderStatus,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cartItems': List.from(
        cartItems.map((e) => e.fromEntity().toMap()),
      ).toList(),
      'createdDate': createdDate,
      'itemCount': itemCount,
      'totalPrice': totalPrice,
      'shippingAddress': shippingAddress,
      'orderNumber': orderNumber,
      'orderStatus': List.from(
        orderStatus.map((e) => e.fromEntity().toMap()),
      ).toList(),
    };
  }
}
