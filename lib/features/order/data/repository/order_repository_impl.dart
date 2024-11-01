import 'package:dartz/dartz.dart';
import 'package:online_store/features/order/data/models/add_to_cart_req_model.dart';
import 'package:online_store/features/order/data/sources/order_firebase_service.dart';
import 'package:online_store/features/order/domain/repository/order_repository.dart';
import 'package:online_store/service_locator.dart';

class OrderRepositoryImpl extends OrderRepository {
  @override
  Future<Either> addToCart(AddToCartReqModel addToCartReqModel) async {
    return await getIt<OrderFirebaseService>().addToCart(addToCartReqModel);
  }
}
