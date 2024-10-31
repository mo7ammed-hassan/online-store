import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/cubits/product/products_display_state.dart';
import 'package:online_store/core/usecase.dart/usecase.dart';

class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  final UseCase useCase;
  ProductsDisplayCubit({required this.useCase}) : super(ProductsInitialState());
  int length = 0;
  void displayProducts({dynamic params}) async {
    emit(ProductsLoading());
    var returnedData = await useCase.call(params: params);
    returnedData.fold((error) {
      emit(
        LoadProductsFailure(),
      );
    }, (data) {
      length = data.length;
      emit(
        ProductsLoaded(products: data),
      );
    });
  }

  void displayInitial() {
    emit(ProductsInitialState());
  }
}
