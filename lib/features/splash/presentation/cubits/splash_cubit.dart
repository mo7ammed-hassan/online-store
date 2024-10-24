import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/features/auth/domain/use_case/is_logged_in_use_case.dart';
import 'package:online_store/features/splash/presentation/cubits/splash_state.dart';
import 'package:online_store/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 4));
    var isLoggedIn = await getIt<IsLoggedInUseCase>().call();
    if (isLoggedIn) {
      emit(
        Authenticated(),
      );
    } else {
      emit(
        UnAuthenticated(),
      );
    }
  }
}
