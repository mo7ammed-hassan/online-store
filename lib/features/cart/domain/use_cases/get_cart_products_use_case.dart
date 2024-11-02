import 'package:dartz/dartz.dart';
import 'package:online_store/core/usecase.dart/usecase.dart';
import 'package:online_store/features/cart/domain/repository/cart_repository.dart';
import 'package:online_store/service_locator.dart';

class GetCartProductsUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await getIt<CartRepository>().getCartProducts();
  }
}
