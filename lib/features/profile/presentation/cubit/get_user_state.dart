import 'package:online_store/features/auth/domain/entities/current_user_entity.dart';

abstract class GetUserState {}

class GetUserLoading extends GetUserState {}

class GetUserLoaded extends GetUserState {
  final CurrentUserEntity user;

  GetUserLoaded(this.user);
}

class GetUserFaliure extends GetUserState {}
