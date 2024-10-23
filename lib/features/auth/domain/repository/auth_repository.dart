import 'package:dartz/dartz.dart';
import 'package:online_store/features/auth/data/models/user_creation_req_model.dart';
import 'package:online_store/features/auth/data/models/user_signin_req_model.dart';

abstract class AuthRepository {
  Future<Either> signup(UserCreationReqModel userCreation);
  Future<Either> signin(UserSigninReqModel userSignin);
  Future<Either> getAges();
}
