import 'package:dartz/dartz.dart';
import 'package:online_store/features/home/data/models/category_model.dart';
import 'package:online_store/features/home/data/source/category_firebase_services.dart';
import 'package:online_store/features/home/domain/repository/category_repository.dart';
import 'package:online_store/service_locator.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<Either> getCategories() async {
    var categories = await getIt<CategoryFirebaseServices>().getCategories();

    return categories.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map((e) => CategoryModel.fromMap(e).toEntity())
              .toList(),
        );
      },
    );
  }
}
