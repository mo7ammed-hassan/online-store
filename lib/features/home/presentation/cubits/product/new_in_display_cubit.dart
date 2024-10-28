import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/features/home/domain/use_case.dart/product/get_new_in_use_case.dart';
import 'package:online_store/features/home/presentation/cubits/product/new_in_display_state.dart';

import 'package:online_store/service_locator.dart';

class NewInDisplayCubit extends Cubit<NewInDisplayState> {
  NewInDisplayCubit() : super(NewInLoading());

  void displayProducts() async {
    var returnedData = await getIt<GetNewInUseCase>().call();
    returnedData.fold((error) {
      emit(
        LoadNewInFailure(),
      );
    }, (data) {
      emit(
        NewInLoaded(products: data),
      );
    });
  }
}
