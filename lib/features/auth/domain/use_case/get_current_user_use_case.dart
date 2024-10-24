import 'package:dartz/dartz.dart';
import 'package:online_store/core/usecase.dart/usecase.dart';
import 'package:online_store/features/auth/domain/repository/auth_repository.dart';
import 'package:online_store/service_locator.dart';

class GetCurrentUserUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await getIt<AuthRepository>().getCurrentUser();
  }
}
