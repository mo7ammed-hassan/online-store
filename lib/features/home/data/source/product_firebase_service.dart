import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_store/core/utils/constants/firebase_constants.dart';
import 'package:online_store/features/home/data/models/product/product_model.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';

abstract class ProductFirebaseService {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductsByCategoryId({required String categoryId});
  Future<Either> getProductsByTitle({required String title});
  Future<Either> addOrRemoveFavoriteProduct({required ProductEntity product});
  Future<bool> isFavoriteProduct({required String productId});
  Future<Either> getFavoriteProducts();
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

  @override
  Future<Either> getProductsByCategoryId({required String categoryId}) async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection(FirebaseConstants.productCollection)
          .where('categoryId', isEqualTo: categoryId)
          .get();

      return Right(
        returnedData.docs.map((e) => e.data()).toList(),
      );
    } catch (e) {
      return const Left('There was an error');
    }
  }

  @override
  Future<Either> getProductsByTitle({required String title}) async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection(FirebaseConstants.productCollection)
          .where('title', isGreaterThanOrEqualTo: title)
          .get();

      return Right(
        returnedData.docs.map((e) => e.data()).toList(),
      );
    } catch (e) {
      return const Left('There was an error');
    }
  }

  @override
  Future<Either> addOrRemoveFavoriteProduct(
      {required ProductEntity product}) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var products = await FirebaseFirestore.instance
          .collection(FirebaseConstants.userCollection)
          .doc(user!.uid)
          .collection(FirebaseConstants.favoriteCollection)
          .where('productId', isEqualTo: product.productId)
          .get();

      if (products.docs.isEmpty) {
        products.docs.first.reference.delete();
        return const Right(false);
      } else {
        await FirebaseFirestore.instance
            .collection(FirebaseConstants.userCollection)
            .doc(user.uid)
            .collection(FirebaseConstants.favoriteCollection)
            .add(product.fromEntity().toMap());
        return const Right(
          true,
        ); // convert entity to model and then to map
      }
    } catch (e) {
      return const Left('Please try again later');
    }
  }

  @override
  Future<Either> getFavoriteProducts() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var favorites = await FirebaseFirestore.instance
          .collection(FirebaseConstants.userCollection)
          .doc(user!.uid)
          .collection(FirebaseConstants.favoriteCollection)
          .get();

      return Right(favorites.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again later');
    }
  }

  @override
  Future<bool> isFavoriteProduct({required String productId}) async {
    try {
      
      var user = FirebaseAuth.instance.currentUser;

      var returnedData = await FirebaseFirestore.instance
          .collection(FirebaseConstants.userCollection)
          .doc(user!.uid)
          .collection(FirebaseConstants.favoriteCollection)
          .where('productId', isEqualTo: productId)
          .get();

      if (returnedData.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
