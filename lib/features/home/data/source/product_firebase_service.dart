import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:online_store/core/utils/constants/firebase_constants.dart';

abstract class ProductFirebaseService {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
}

class ProductFirebaseServiceImpl extends ProductFirebaseService {
  @override
  Future<Either> getTopSelling() async {
    try {
      var products = await FirebaseFirestore.instance
          .collection(FirebaseConstants.productCollection)
          .where('salesNumber', isGreaterThan: 20)
          .limit(3)
          .get();

      return Right(
        products.docs.map((e) => e.data()).toList(),
      );
    } catch (e) {
      return const Left('There was an error');
    }
  }

  @override
  Future<Either> getNewIn() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection(FirebaseConstants.productCollection)
          .where(
            'createdDate',
            isGreaterThanOrEqualTo: Timestamp.fromDate(
              DateTime.now().subtract(
                const Duration(days: 3),
              ),
            ),
          )
          .get();

      return Right(
        returnedData.docs.map((e) => e.data()).toList(),
      );
    } catch (e) {
      return const Left('There was an error');
    }
  }
}
