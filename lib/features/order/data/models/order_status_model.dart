import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:online_store/features/order/domain/entity/order_status_entity.dart';

class OrderStatusModel {
  final String title;
  final bool done;
  final Timestamp createdDate;

  OrderStatusModel({
    required this.title,
    required this.done,
    required this.createdDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'done': done,
      'createdDate': createdDate,
    };
  }

  factory OrderStatusModel.fromMap(Map<String, dynamic> map) {
    return OrderStatusModel(
      title: map['title'] as String,
      done: map['done'] as bool,
      createdDate: map['createdDate'] as Timestamp,
    );
  }
}

extension OrderStatusXModel on OrderStatusModel {
  OrderStatusEntity toEntity() {
    return OrderStatusEntity(
      title: title,
      done: done,
      createdDate: createdDate,
    );
  }
}

extension OrderStatusXEntity on OrderStatusEntity {
  OrderStatusModel fromEntity() {
    return OrderStatusModel(
      title: title,
      done: done,
      createdDate: createdDate,
    );
  }
}
