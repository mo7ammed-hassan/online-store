import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSizeSelectionCubit extends Cubit<int> {
  ProductSizeSelectionCubit() : super(0);

  int selectedSize = 0;
  void selectSize(int index) {
    selectedSize = index;
    emit(index);
  }
}
