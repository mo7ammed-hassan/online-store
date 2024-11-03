import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_store/core/utils/constants/firebase_constants.dart';
import 'package:online_store/features/checkout/data/models/order_registration_req_model.dart';

abstract class OrderFirebaseService {
  Future<Either> orderRegistration(OrderRegistrationReqModel order);
}

class OrderFirebaseServiceImpl implements OrderFirebaseService {
  @override
  Future<Either> orderRegistration(OrderRegistrationReqModel order) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      FirebaseFirestore.instance
          .collection(FirebaseConstants.userCollection)
          .doc(user!.uid)
          .collection(FirebaseConstants.orderCollection)
          .add(order.toMap());

      return const Right("Order registered successfully");
    } catch (e) {
      return Left(e);
    }
  }
}