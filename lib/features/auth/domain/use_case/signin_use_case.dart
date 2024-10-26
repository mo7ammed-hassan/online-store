import 'package:dartz/dartz.dart';
import 'package:online_store/core/usecase.dart/usecase.dart';
import 'package:online_store/features/auth/data/models/user_signin_req_model.dart';
import 'package:online_store/features/auth/domain/repository/auth_repository.dart';
import 'package:online_store/service_locator.dart';

class SigninUseCase implements UseCase<Either, UserSigninReqModel> {
  @override
  Future<Either> call({UserSigninReqModel? params}) async {
    return await getIt<AuthRepository>().signin(params!);
  }
}
