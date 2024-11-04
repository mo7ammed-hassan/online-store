import 'package:dartz/dartz.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';

abstract class ProductRepository {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductsByCategoryId({required String categoryId});
  Future<Either> getProductsByTitle({required String title});
  Future<Either> addOrRemoveFavoriteProduct({required ProductEntity product});
  Future<bool> isFavoriteProduct({required String productId});
  Future<Either> getFavoriteProducts();
}
