import 'package:online_store/features/auth/domain/entities/current_user_entity.dart';

class CurrentUserModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String image;
  final int gender;

  CurrentUserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'image': image,
      'gender': gender,
    };
  }

  factory CurrentUserModel.fromMap(Map<String, dynamic> map) {
    return CurrentUserModel(
      userId: map['userId'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] as String,
      image: map['image'] ?? '',
      gender: map['gender'] as int,
    );
  }

  factory CurrentUserModel.fromJson(Map<String, dynamic> data) {
    return CurrentUserModel.fromMap(data);
  }
}

extension CurrentUserXModel on CurrentUserModel {
  CurrentUserEntity toEntity() {
    return CurrentUserEntity(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      image: image,
      gender: gender,
    );
  }
}
