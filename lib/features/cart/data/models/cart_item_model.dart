import 'package:online_store/features/cart/domain/entity/cart_item_entity.dart';

class CartItemModel {
  final String productId;
  final String productTitle;
  final int productQuantity;
  final String productColor;
  final String productSize;
  final double productPrice;
  final double totalPrice;
  final String productImageUrl;
  final String createdDate;
  final String id;

  CartItemModel({
    required this.productId,
    required this.productTitle,
    required this.productQuantity,
    required this.productColor,
    required this.productSize,
    required this.productPrice,
    required this.totalPrice,
    required this.productImageUrl,
    required this.createdDate,
    required this.id,
  });

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      productId: map['productId'] as String,
      productTitle: map['productTitle'] as String,
      productQuantity: map['productQuantity'] as int,
      productColor: map['productColor'] as String,
      productSize: map['productSize'] as String,
      productPrice: map['productPrice'] as double,
      totalPrice: map['totalPrice'] as double,
      productImageUrl: map['productImageUrl'] as String,
      createdDate: map['createdDate'] as String,
      id: map['id'] as String,
    );
  }
}
// convert cartItem model to cartItem entity

extension CartItemXModel on CartItemModel {
  CartItemEntity toEntity() {
    return CartItemEntity(
      productId: productId,
      productTitle: productTitle,
      productPrice: totalPrice,
      productColor: productColor,
      productSize: productSize,
      productImage: productImageUrl,
      productQuantity: productQuantity,
      createdDate: createdDate,
      totalPrice: totalPrice,
      id: id,
    );
  }
}
