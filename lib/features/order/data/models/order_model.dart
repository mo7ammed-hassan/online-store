import 'package:online_store/features/cart/data/models/cart_item_model.dart';
import 'package:online_store/features/order/data/models/order_status_model.dart';
import 'package:online_store/features/order/domain/entity/order_entity.dart';

class OrderModel {
  final List<CartItemModel> cartItems;
  final String createdDate;
  final int itemCount;
  final double totalPrice;
  final String shippingAddress;
  final String orderNumber;
  final List<OrderStatusModel> orderStatus;

  OrderModel({
    required this.cartItems,
    required this.createdDate,
    required this.itemCount,
    required this.totalPrice,
    required this.shippingAddress,
    required this.orderNumber,
    required this.orderStatus,
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
      orderStatus: List<OrderStatusModel>.from(
        (map['orderStatus']).map(
          (e) => OrderStatusModel.fromMap(e as Map<String, dynamic>),
        ),
      ),
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
      orderStatus: orderStatus.map((item) => item.toEntity()).toList(),
    );
  }
}
