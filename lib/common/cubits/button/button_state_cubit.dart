import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/cubits/button/button_state.dart';
import 'package:online_store/core/usecase.dart/usecase.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  Future<void> execute(
      {required dynamic params, required Usecase useCase}) async {
    emit(ButtonLoadingState());

    try {
      // params like userCreantial request
      Either returnedData = await useCase.call(params: params);
      returnedData.fold((failure) {
        emit(
          ButtonFailureState(message: failure),
        );
      }, (success) {
        emit(
          ButtonSuccessState(message: success),
        );
      });
    } catch (e) {
      emit(
        ButtonFailureState(message: e.toString()),
      );
    }
  }
}
