import 'package:dartz/dartz.dart';
import 'package:online_store/features/cart/data/models/add_to_cart_req_model.dart';
import 'package:online_store/features/cart/data/models/cart_item_model.dart';
import 'package:online_store/features/cart/data/sources/cart_firebase_service.dart';
import 'package:online_store/features/cart/domain/entity/cart_item_entity.dart';
import 'package:online_store/features/cart/domain/repository/cart_repository.dart';
import 'package:online_store/service_locator.dart';

class CartRepositoryImpl extends CartRepository {
  @override
  Future<Either> addToCart(AddToCartReqModel addToCartReqModel) async {
    return await getIt<CartFirebaseService>().addToCart(addToCartReqModel);
  }

  @override
  Future<Either> getCartProducts() async {
    var returnedData = await getIt<CartFirebaseService>().getCartProducts();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map((e) => CartItemModel.fromMap(e).toEntity())
              .toList(),
        );
      },
    );
  }

  @override
  Future<Either> removeCartItem({required String cartItemId}) async {
    var returnedData = await getIt<CartFirebaseService>()
        .removeCartItem(cartItemId: cartItemId);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (message) {
        return Right(message);
      },
    );
  }

  @override
  Future<Either> addCartItem({required CartItemEntity cartItem}) async {
    var returnedData =
        await getIt<CartFirebaseService>().updateCartItem(cartItem: cartItem);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (message) {
        return Right(message);
      },
    );
  }
}
