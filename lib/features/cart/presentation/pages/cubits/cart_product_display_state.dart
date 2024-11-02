import 'package:online_store/features/cart/domain/entity/cart_item_entity.dart';

abstract class CartProductDisplayState {}

class CartProductLoading extends CartProductDisplayState {}

class CartProductLoaded extends CartProductDisplayState {
  final List<CartItemEntity> cartproducts;

  CartProductLoaded({required this.cartproducts});
}

class CartProductFailure extends CartProductDisplayState {
  final String error;

  CartProductFailure({required this.error});
}
