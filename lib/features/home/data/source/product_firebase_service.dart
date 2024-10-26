import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:online_store/core/utils/constants/firebase_constants.dart';

abstract class ProductFirebaseService {
  Future<Either> getTopSelling();
}

class ProductFirebaseServiceImpl extends ProductFirebaseService {
  @override
  Future<Either> getTopSelling() async {
    try {
      var products = await FirebaseFirestore.instance
          .collection(FirebaseConstants.productCollection)
          .where('salesNumber', isGreaterThan: 20)
          .get();
      return Right(
        products.docs.map((e) => e.data()).toList(),
      );
    } catch (e) {
      return const Left('There was an error');
    }
  }
}
