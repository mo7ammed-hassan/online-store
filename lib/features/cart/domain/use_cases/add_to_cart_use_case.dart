import 'package:dartz/dartz.dart';
import 'package:online_store/core/usecase.dart/usecase.dart';
import 'package:online_store/features/cart/data/models/add_to_cart_req_model.dart';
import 'package:online_store/features/cart/domain/repository/cart_repository.dart';
import 'package:online_store/service_locator.dart';

class AddToCartUseCase extends UseCase<Either, AddToCartReqModel> {
  @override
  Future<Either> call({AddToCartReqModel? params}) async {
    return await getIt<CartRepository>().addToCart(params!);
  }
}
