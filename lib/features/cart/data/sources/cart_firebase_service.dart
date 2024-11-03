import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_store/core/utils/constants/firebase_constants.dart';
import 'package:online_store/features/cart/data/models/add_to_cart_req_model.dart';
import 'package:online_store/features/cart/domain/entity/cart_item_entity.dart';

// respect dependance inverstion from solid princible
abstract class CartFirebaseService {
  Future<Either> addToCart(AddToCartReqModel addToCartReqModel);
  Future<Either> getCartProducts();
  Future<Either> removeCartItem({required String cartItemId});
  Future<Either> updateCartItem({
    required CartItemEntity cartItem,
  });
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

      List<Map> products = [];
      for (var item in data.docs) {
        var data = item.data();
        data.addAll({'id': item.id});
        products.add(data);
      }
      return Right(products);
    } catch (e) {
      return const Left('There was an error');
    }
  }

  @override
  Future<Either> removeCartItem({required String cartItemId}) async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection(FirebaseConstants.userCollection)
          .doc(user!.uid)
          .collection(FirebaseConstants.cartCollection)
          .doc(cartItemId)
          .delete();

      return const Right('Product was successfully removed');
    } catch (e) {
      return const Left('There was an error');
    }
  }

  @override
  Future<Either> updateCartItem({
    required CartItemEntity cartItem,
  }) async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection(FirebaseConstants.userCollection)
          .doc(user!.uid)
          .collection(FirebaseConstants.cartCollection)
          .doc(cartItem.id)
          .update({
        'productQuantity': cartItem.productQuantity + 1,
      });

      return const Right('Product was added Successfully');
    } catch (e) {
      return const Left('There was an error');
    }
  }
}
