import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/features/auth/domain/use_case/get_current_user_use_case.dart';
import 'package:online_store/features/home/presentation/cubits/user_info_display_state.dart';
import 'package:online_store/service_locator.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  UserInfoDisplayCubit() : super(UserInfoLoading());

  void displayUserInfo() async {
    var returnedData = await getIt<GetCurrentUserUseCase>().call();

    returnedData.fold(
      (error) {
        emit(
          LoadUserInfoFailure(),
        );
      },
      (data) {
        emit(
          UserInfoLoaded(data),
        );
      },
    );
  }
}
