import 'package:dartz/dartz.dart';
import 'package:online_store/core/usecase.dart/usecase.dart';
import 'package:online_store/features/cart/domain/repository/cart_repository.dart';
import 'package:online_store/service_locator.dart';

class RemoveItemFromCartUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await getIt<CartRepository>().removeCartItem(cartItemId: params!);
  }
}
