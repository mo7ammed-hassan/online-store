import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/features/home/domain/use_case.dart/category/get_categories_use_case.dart';
import 'package:online_store/features/home/presentation/cubits/categories/categories_display_state.dart';
import 'package:online_store/service_locator.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {
  CategoriesDisplayCubit() : super(CategoriesLoading());

  void dispalyCategories() async {
    var returnedData = await getIt<GetCategoriesUseCase>().call();

    // fold
    returnedData.fold(
      (error) {
        emit(LoadCategoriesFailure());
      },
      (data) {
        emit(CategoriesLoaded(categories: data));
      },
    );
  }
}
