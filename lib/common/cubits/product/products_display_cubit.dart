import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/cubits/product/products_display_state.dart';
import 'package:online_store/core/usecase.dart/usecase.dart';

class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  final UseCase useCase;
  ProductsDisplayCubit({required this.useCase}) : super(ProductsInitialState());

  void displayProducts() async {
    emit(ProductsLoading());
    var returnedData = await useCase.call();
    returnedData.fold((error) {
      emit(
        LoadProductsFailure(),
      );
    }, (data) {
      emit(
        ProductsLoaded(products: data),
      );
    });
  }
}
