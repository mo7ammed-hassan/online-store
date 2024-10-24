import 'package:online_store/core/usecase.dart/usecase.dart';
import 'package:online_store/features/auth/domain/repository/auth_repository.dart';
import 'package:online_store/service_locator.dart';

class IsLoggedInUseCase implements Usecase<bool, dynamic> {
  @override
  Future<bool> call({dynamic params}) async {
    return await getIt<AuthRepository>().isLoggedIn();
  }
}
