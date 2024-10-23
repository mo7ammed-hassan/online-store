import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/features/auth/domain/use_case/get_ages.dart';
import 'package:online_store/features/auth/presentation/cubits/get_ages_state.dart';
import 'package:online_store/service_locator.dart';

class GetAgesCubit extends Cubit<GetAgesState> {
  GetAgesCubit() : super(GetAgesLoading());

  void getAges() async {
    var ages = await getIt<GetAgesUseCase>().call();

    ages.fold((failure) {
      emit(
        GetAgesFailure(failure),
      );
    }, (data) {
      emit(
        GetAgesLoaded(data),
      );
    });
  }
}
