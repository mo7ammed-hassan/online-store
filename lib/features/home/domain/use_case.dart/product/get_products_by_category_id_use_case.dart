import 'package:dartz/dartz.dart';
import 'package:online_store/core/usecase.dart/usecase.dart';
import 'package:online_store/features/home/domain/repository/product_repository.dart';
import 'package:online_store/service_locator.dart';

class GetProductsByCategoryIdUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await getIt<ProductRepository>()
        .getProductsByCategoryId(categoryId: params!);
  }
}
