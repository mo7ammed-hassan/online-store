// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:online_store/features/cart/data/models/cart_item_model.dart';
import 'package:online_store/features/cart/domain/entity/cart_item_entity.dart';

class OrderRegistrationReqModel {
  final List<CartItemEntity> cartItems;
  final String createdDate;
  final int itemCount;
  final double totalPrice;

  OrderRegistrationReqModel({
    required this.cartItems,
    required this.createdDate,
    required this.itemCount,
    required this.totalPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cartItems': List.from(
        cartItems.map((e) => e.fromEntity().toMap()),
      ).toList(),
      'createdDate': createdDate,
      'itemCount': itemCount,
      'totalPrice': totalPrice,
    };
  }
}
