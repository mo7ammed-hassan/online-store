import 'package:dartz/dartz.dart';
import 'package:online_store/features/order/data/models/add_to_cart_req_model.dart';

abstract class OrderRepository {

  Future<Either> addToCart(AddToCartReqModel addToCartReqModel);
  
}
