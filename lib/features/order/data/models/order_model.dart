// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:online_store/features/cart/data/models/cart_item_model.dart';
import 'package:online_store/features/order/domain/entity/order_entity.dart';

class OrderModel {
  final List<CartItemModel> cartItems;
  final String createdDate;
  final int itemCount;
  final double totalPrice;
  final String shippingAddress;
  final String orderNumber;

  OrderModel({
    required this.cartItems,
    required this.createdDate,
    required this.itemCount,
    required this.totalPrice,
    required this.shippingAddress,
    required this.orderNumber,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      cartItems: List<CartItemModel>.from(
        (map['cartItems']).map(
          (e) => CartItemModel.fromMap(e as Map<String, dynamic>),
        ),
      ),
      createdDate: map['createdDate'] as String,
      itemCount: map['itemCount'] as int,
      totalPrice: map['totalPrice'] as double,
      shippingAddress: map['shippingAddress'] as String,
      orderNumber: map['orderNumber'] as String,
    );
  }
}

extension OrderXModel on OrderModel {
  OrderEntity toEntity() {
    return OrderEntity(
      cartItems: cartItems.map((item) => item.toEntity()).toList(),
      createdDate: createdDate,
      itemCount: itemCount,
      totalPrice: totalPrice,
      shippingAddress: shippingAddress,
      orderNumber: orderNumber,
    );
  }
}
