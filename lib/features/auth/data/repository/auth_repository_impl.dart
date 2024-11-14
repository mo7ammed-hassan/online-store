import 'package:dartz/dartz.dart';
import 'package:online_store/features/auth/data/models/current_user_model.dart';
import 'package:online_store/features/auth/data/models/user_creation_req_model.dart';
import 'package:online_store/features/auth/data/models/user_signin_req_model.dart';
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

  @override
  Future<Either> signin(UserSigninReqModel userSignin) async {
    return await getIt.get<AuthFirebaseService>().signin(userSignin);
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    return await getIt.get<AuthFirebaseService>().sendPasswordResetEmail(email);
  }

  @override
  Future<bool> isLoggedIn() async {
    return await getIt.get<AuthFirebaseService>().isLoggedIn();
  }

  @override
  Future<Either> getCurrentUser() async {
    var user = await getIt.get<AuthFirebaseService>().getCurrentUser();

    return user.fold((error) {
      return Left(error);
    }, (data) {
      return Right(
        CurrentUserModel.fromJson(data).toEntity(),
      );
    });
  }

  @override
  Future<Either> signOut() async {
    return await getIt.get<AuthFirebaseService>().signOut();
  }
}
