import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/features/favorite/presentation/cubits/get_favorites_products_state.dart';
import 'package:online_store/features/home/domain/use_case.dart/product/get_favorite_products_use_case.dart';
import 'package:online_store/service_locator.dart';

class GetFavoritesProductCubit extends Cubit<GetFavoritesProductsState> {
  GetFavoritesProductCubit() : super(GetFavoritesProductsLoading());

  void getFavoriteProducts() async {
    var data = await getIt<GetFavoriteProductsUseCase>().call();

    data.fold(
      (error) {
        emit(
          GetFavoritesProductsFailure(error),
        );
      },
      (products) {
        emit(
          GetFavoritesProductsLoaded(products: products),
        );
      },
    );
  }
}
