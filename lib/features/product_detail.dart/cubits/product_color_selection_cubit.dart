import 'package:flutter_bloc/flutter_bloc.dart';

class ProductColorsSelectionCubit extends Cubit<int> {
  ProductColorsSelectionCubit() : super(0);

  // to store value of index 
  int selectedIndex = 0;
  void selectColor(int index) {
    selectedIndex = index;
    emit(index);
  }
}
