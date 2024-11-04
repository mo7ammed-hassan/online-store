import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';
import 'package:online_store/features/home/domain/use_case.dart/product/add_or_remove_favorite_product_use_case.dart';
import 'package:online_store/features/home/domain/use_case.dart/product/is_favorite_product_use_case.dart';
import 'package:online_store/service_locator.dart';

class FavoriteIconCuit extends Cubit<bool> {
  FavoriteIconCuit() : super(false);

  void isFavorite(String productId) async {
    var result =
        await getIt<IsFavoriteProductUseCase>().call(params: productId);
    emit(result);
  }

  void onTap(ProductEntity product) async {
    var result =
        await getIt<AddOrRemoveFavoriteProductUseCase>().call(params: product);

    result.fold(
      (error) {},
      (data) {
        emit(data);
      },
    );
  }
}
