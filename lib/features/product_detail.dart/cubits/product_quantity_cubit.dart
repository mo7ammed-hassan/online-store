import 'package:flutter_bloc/flutter_bloc.dart';

class ProductQuantityCubit extends Cubit<int> {
  ProductQuantityCubit() : super(1);

  void addToBag() => emit(state + 1);

  void removeFromBag() {
    if (state > 1) {
      emit(state - 1);
    }
  }
}