import 'package:get_it/get_it.dart';
import 'package:online_store/features/auth/data/repository/auth_repository_impl.dart';
import 'package:online_store/features/auth/data/source/auth_firebase_service.dart';
import 'package:online_store/features/auth/domain/repository/auth_repository.dart';
import 'package:online_store/features/auth/domain/use_case/signup_use_case.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Services
  getIt.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  // Repositories
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );

  // UseCases
  getIt.registerSingleton<SignupUseCase>(
    SignupUseCase(),
  );
}
