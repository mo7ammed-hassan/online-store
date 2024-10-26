// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:online_store/common/cubits/product/products_display_state.dart';
// import 'package:online_store/core/usecase.dart/usecase.dart';

// class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
//   ProductsDisplayCubit() : super(ProductsInitialState());

//   void displayProducts({required UseCase usecase, dynamic params}) async {
//     emit(ProductsLoading());

//     var returnedData = await usecase.call(
//       params: params,
//     );
//     returnedData.fold((error) {
//       emit(
//         LoadProductsFailure(),
//       );
//     }, (data) {
//       emit(
//         ProductsLoaded(products: data),
//       );
//     });
//   }
// }
