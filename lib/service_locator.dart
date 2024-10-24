import 'package:get_it/get_it.dart';
import 'package:online_store/features/auth/data/repository/auth_repository_impl.dart';
import 'package:online_store/features/auth/data/source/auth_firebase_service.dart';
import 'package:online_store/features/auth/domain/repository/auth_repository.dart';
import 'package:online_store/features/auth/domain/use_case/get_ages.dart';
import 'package:online_store/features/auth/domain/use_case/get_current_user_use_case.dart';
import 'package:online_store/features/auth/domain/use_case/is_logged_in_use_case.dart';
import 'package:online_store/features/auth/domain/use_case/send_password_reset_email_use_case.dart';
import 'package:online_store/features/auth/domain/use_case/signin_use_case.dart';
import 'package:online_store/features/auth/domain/use_case/signup_use_case.dart';
import 'package:online_store/features/home/data/repository/category_repository_impl.dart';
import 'package:online_store/features/home/data/source/category_firebase_services.dart';
import 'package:online_store/features/home/domain/repository/category_repository.dart';
import 'package:online_store/features/home/domain/use_case.dart/get_categories_use_case.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Services
  getIt.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );
  getIt.registerSingleton<CategoryFirebaseServices>(
    CategoryFirebaseServicesImpl(),
  );

  // Repositories
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );
  getIt.registerSingleton<CategoryRepository>(
    CategoryRepositoryImpl(),
  );

  // UseCases
  getIt.registerSingleton<SignupUseCase>(
    SignupUseCase(),
  );
  getIt.registerSingleton<GetAgesUseCase>(
    GetAgesUseCase(),
  );
  getIt.registerSingleton<SigninUseCase>(
    SigninUseCase(),
  );
  getIt.registerSingleton<SendPasswordResetEmailUseCase>(
    SendPasswordResetEmailUseCase(),
  );
  getIt.registerSingleton<IsLoggedInUseCase>(
    IsLoggedInUseCase(),
  );
  getIt.registerSingleton<GetCurrentUserUseCase>(
    GetCurrentUserUseCase(),
  );
  getIt.registerSingleton<GetCategoriesUseCase>(
    GetCategoriesUseCase(),
  );
}
