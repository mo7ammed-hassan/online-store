import 'package:flutter_bloc/flutter_bloc.dart';

class QuantityProductCubit extends Cubit<int> {
  QuantityProductCubit() : super(1);

  void addToBag() => emit(state + 1);

  void removeFromBag() {
    if (state > 0) {
      emit(state - 1);
    }
  }
}
