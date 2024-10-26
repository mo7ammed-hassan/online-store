import 'package:dartz/dartz.dart';
import 'package:online_store/core/usecase.dart/usecase.dart';
import 'package:online_store/features/auth/data/models/user_creation_req_model.dart';
import 'package:online_store/features/auth/domain/repository/auth_repository.dart';
import 'package:online_store/service_locator.dart';

class SignupUseCase implements UseCase<Either, UserCreationReqModel> {
  @override
  Future<Either> call({UserCreationReqModel? params}) async {
    return await getIt<AuthRepository>().signup(params!);
  }
}
