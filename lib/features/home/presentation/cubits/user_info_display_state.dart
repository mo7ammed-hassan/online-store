import 'package:online_store/features/auth/domain/entities/current_user_entity.dart';

abstract class UserInfoDisplayState {}

class UserInfoLoading extends UserInfoDisplayState {}

class UserInfoLoaded extends UserInfoDisplayState {
  final CurrentUserEntity userEntity;

  UserInfoLoaded(this.userEntity);
}

class LoadUserInfoFailure extends UserInfoDisplayState {}
