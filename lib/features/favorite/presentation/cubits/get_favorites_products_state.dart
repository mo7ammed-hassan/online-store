import 'package:online_store/features/home/domain/entity/product/product_entity.dart';

abstract class GetFavoritesProductsState {}

// loading

class GetFavoritesProductsLoading extends GetFavoritesProductsState {}

class GetFavoritesProductsLoaded extends GetFavoritesProductsState {
  final List<ProductEntity> products;

  GetFavoritesProductsLoaded({required this.products});
}

class GetFavoritesProductsFailure extends GetFavoritesProductsState {
  final String errorMessage;

  GetFavoritesProductsFailure(this.errorMessage);
}
