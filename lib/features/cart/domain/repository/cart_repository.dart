import 'package:dartz/dartz.dart';
import 'package:online_store/features/cart/data/models/add_to_cart_req_model.dart';
import 'package:online_store/features/cart/domain/entity/cart_item_entity.dart';

abstract class CartRepository {
  Future<Either> addToCart(AddToCartReqModel addToCartReqModel);
  Future<Either> getCartProducts();
  Future<Either> removeCartItem({required String cartItemId});
  Future<Either> addCartItem( {required CartItemEntity cartItem});
}
