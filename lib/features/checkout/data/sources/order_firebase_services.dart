import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_store/core/utils/constants/firebase_constants.dart';
import 'package:online_store/features/checkout/data/models/order_registration_req_model.dart';

abstract class OrderFirebaseService {
  Future<Either> orderRegistration(OrderRegistrationReqModel order);
  Future<Either> getOrders();
}

class OrderFirebaseServiceImpl implements OrderFirebaseService {
  @override
  Future<Either> orderRegistration(OrderRegistrationReqModel order) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection(FirebaseConstants.userCollection)
          .doc(user!.uid)
          .collection(FirebaseConstants.orderCollection)
          .add(order.toMap());

      // remove order from cart
      for (var item in order.cartItems) {
        await FirebaseFirestore.instance
            .collection(FirebaseConstants.userCollection)
            .doc(user.uid)
            .collection(FirebaseConstants.cartCollection)
            .doc(item.id)
            .delete();
      }

      return const Right("Order registered successfully");
    } catch (e) {
      return const Left('There was an error,please try again');
    }
  }

  @override
  Future<Either> getOrders() async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      var data = await FirebaseFirestore.instance
          .collection(FirebaseConstants.userCollection)
          .doc(user!.uid)
          .collection(FirebaseConstants.orderCollection)
          .get();

      return Right(
        data.docs.map((e) => e.data()),
      );
    } catch (e) {
      return const Left('There was an error,please try again');
    }
  }
}
