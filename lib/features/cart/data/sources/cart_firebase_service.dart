import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_store/core/utils/constants/firebase_constants.dart';
import 'package:online_store/features/cart/data/models/add_to_cart_req_model.dart';

// respect dependance inverstion from solid princible
abstract class CartFirebaseService {
  Future<Either> addToCart(AddToCartReqModel addToCartReqModel);
  Future<Either> getCartProducts();
}

class CartFirebaseServiceImpl implements CartFirebaseService {
  @override
  Future<Either> addToCart(AddToCartReqModel addToCartReq) async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection(FirebaseConstants.userCollection)
          .doc(user!.uid)
          .collection(FirebaseConstants.cartCollection)
          .add(addToCartReq.toMap());

      return const Right("Add to cart successfully!");
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> getCartProducts() async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      var data = await FirebaseFirestore.instance
          .collection(FirebaseConstants.userCollection)
          .doc(user!.uid)
          .collection(FirebaseConstants.cartCollection)
          .orderBy('createdDate', descending: false)
          .get();

      return Right(data.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('There was an error');
    }
  }
}
