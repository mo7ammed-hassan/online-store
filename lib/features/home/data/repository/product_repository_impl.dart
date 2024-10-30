import 'package:dartz/dartz.dart';
import 'package:online_store/features/home/data/models/product/product_model.dart';
import 'package:online_store/features/home/data/source/product_firebase_service.dart';
import 'package:online_store/features/home/domain/repository/product_repository.dart';
import 'package:online_store/service_locator.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Either> getTopSelling() async {
    var returnedData =
        await getIt.get<ProductFirebaseService>().getTopSelling();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        // convert a list of maps to a list of ProductModel objects, then convert them to a list of ProductEntity
        return Right(
          List.from(data)
              .map((e) => ProductModel.fromMap(e).toEntity())
              .toList(),
        );
      },
    );
  }

  @override
  Future<Either> getNewIn() async {
    var returnedData = await getIt.get<ProductFirebaseService>().getNewIn();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map((e) => ProductModel.fromMap(e).toEntity())
              .toList(),
        );
      },
    );
  }

  @override
  Future<Either> getProductsByCategoryId({required String categoryId}) async {
    var returnedData = await getIt
        .get<ProductFirebaseService>()
        .getProductsByCategoryId(categoryId: categoryId);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map((e) => ProductModel.fromMap(e).toEntity())
              .toList(),
        );
      },
    );
  }
}
