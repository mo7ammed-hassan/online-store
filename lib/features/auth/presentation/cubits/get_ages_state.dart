import 'package:cloud_firestore/cloud_firestore.dart';

abstract class GetAgesState {}

class GetAgesLoading extends GetAgesState {}

class GetAgesLoaded extends GetAgesState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> ages;

  GetAgesLoaded(this.ages);
}

class GetAgesFailure extends GetAgesState {
  final String error;

  GetAgesFailure(this.error);
}
