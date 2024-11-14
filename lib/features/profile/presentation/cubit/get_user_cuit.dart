import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/features/auth/domain/use_case/get_current_user_use_case.dart';
import 'package:online_store/features/profile/presentation/cubit/get_user_state.dart';
import 'package:online_store/service_locator.dart';

class GetUserCuit extends Cubit<GetUserState> {
  GetUserCuit() : super(GetUserLoading());

  void getUser() async {
    var returnedData = await getIt<GetCurrentUserUseCase>().call();

    returnedData.fold(
      (error) {
        emit(GetUserFaliure());
      },
      (userData) {
        emit(GetUserLoaded(userData));
      },
    );
  }
}
