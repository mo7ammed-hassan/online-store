import 'package:online_store/core/usecase.dart/usecase.dart';
import 'package:online_store/features/home/domain/repository/product_repository.dart';
import 'package:online_store/service_locator.dart';

class IsFavoriteProductUseCase implements UseCase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await getIt<ProductRepository>()
        .isFavoriteProduct(productId: params!);
  }
}
