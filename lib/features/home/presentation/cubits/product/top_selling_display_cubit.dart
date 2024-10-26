import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/features/home/domain/use_case.dart/product/get_top_selling_use_case.dart';
import 'package:online_store/features/home/presentation/cubits/product/top_selling_display_state.dart';
import 'package:online_store/service_locator.dart';

class TopSellingDisplayCubit extends Cubit<TopSellingDisplayState> {
  TopSellingDisplayCubit() : super(TopSellingLoading());

  void displayProducts() async {
    var returnedData = await getIt<GetTopSellingUseCase>().call();
    returnedData.fold((error) {
      emit(
        LoadTopSellingFailure(),
      );
    }, (data) {
      emit(
        TopSellingLoaded(products: data),
      );
    });
  }
}
