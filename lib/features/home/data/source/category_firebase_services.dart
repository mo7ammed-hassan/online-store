import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:online_store/core/utils/constants/firebase_constants.dart';

abstract class CategoryFirebaseServices {
  Future<Either> getCategories();
}

class CategoryFirebaseServicesImpl extends CategoryFirebaseServices {
  @override
  Future<Either> getCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> categories = await FirebaseFirestore
          .instance
          .collection(FirebaseConstants.categoryCollection)
          .get();

      return Right(categories);
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
