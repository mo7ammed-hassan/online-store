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
      var categories = await FirebaseFirestore.instance
          .collection(FirebaseConstants.categoryCollection)
          .orderBy('title', descending: true)
          .get();

      return Right(
        categories.docs
            .map(
              (e) => e.data(),
            )
            .toList(),
      );
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
