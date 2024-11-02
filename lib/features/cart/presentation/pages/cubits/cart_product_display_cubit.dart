import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/features/cart/domain/use_cases/get_cart_products_use_case.dart';
import 'package:online_store/features/cart/presentation/pages/cubits/cart_product_display_state.dart';
import 'package:online_store/service_locator.dart';

class CartProductDisplayCubit extends Cubit<CartProductDisplayState> {
  CartProductDisplayCubit() : super(CartProductLoading());

  void displayCartProducts() async {
    var returnedData = await getIt<GetCartProductsUseCase>().call();

    returnedData.fold(
      (error) {
        emit(CartProductFailure(error: error));
      },
      (data) {
        emit(CartProductLoaded(cartproducts: data));
      },
    );
  }
}
