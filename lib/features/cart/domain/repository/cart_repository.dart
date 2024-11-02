import 'package:dartz/dartz.dart';
import 'package:online_store/features/cart/data/models/add_to_cart_req_model.dart';

abstract class CartRepository {

  Future<Either> addToCart(AddToCartReqModel addToCartReqModel);
  Future<Either> getCartProducts( );
  
}
