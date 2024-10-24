// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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
      userId: map['userId'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      image: map['image'] as String,
      gender: map['gender'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentUserModel.fromJson(String source) =>
      CurrentUserModel.fromMap(json.decode(source) as Map<String, dynamic>);
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
