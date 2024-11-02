import 'package:dartz/dartz.dart';
import 'package:online_store/features/cart/data/models/add_to_cart_req_model.dart';
import 'package:online_store/features/cart/data/sources/cart_firebase_service.dart';
import 'package:online_store/features/cart/domain/repository/cart_repository.dart';
import 'package:online_store/service_locator.dart';

class CartRepositoryImpl extends CartRepository {
  @override
  Future<Either> addToCart(AddToCartReqModel addToCartReqModel) async {
    return await getIt<OrderFirebaseService>().addToCart(addToCartReqModel);
  }
}
