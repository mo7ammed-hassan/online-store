import 'package:dartz/dartz.dart';
import 'package:online_store/features/auth/data/models/user_creation_req_model.dart';
import 'package:online_store/features/auth/data/source/auth_firebase_service.dart';
import 'package:online_store/features/auth/domain/repository/auth_repository.dart';
import 'package:online_store/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(UserCreationReqModel userCreation) async {
    return await getIt.get<AuthFirebaseService>().signup(userCreation);
  }

  @override
  Future<Either> getAges() async {
    return await getIt.get<AuthFirebaseService>().getAges();
  }
}
