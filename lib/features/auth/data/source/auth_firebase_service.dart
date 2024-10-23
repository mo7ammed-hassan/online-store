import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_store/core/utils/constants/firebase_constants.dart';
import 'package:online_store/features/auth/data/models/user_creation_req_model.dart';
import 'package:online_store/features/auth/data/models/user_signin_req_model.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserCreationReqModel userCreation);
  Future<Either> signin(UserSigninReqModel userSignin);
  Future<Either> getAges();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signup(UserCreationReqModel userCreation) async {
    try {
      UserCredential firebaseAuth =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userCreation.email!,
        password: userCreation.password!,
      );

      await FirebaseFirestore.instance
          .collection(FirebaseConstants.userCollection)
          .doc(firebaseAuth.user!.uid)
          .set({
        'firstName': userCreation.firstName,
        'lastName': userCreation.lastName,
        'email': userCreation.email,
        'gender': userCreation.gender,
        'age': userCreation.age,
      });

      return const Right('Sign up was successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The email address is already in use.';
      }

      return Left(message);
    } catch (e) {
      return const Left('There Was an Error, please try again');
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var data = await FirebaseFirestore.instance
          .collection(FirebaseConstants.ageCollection)
          .orderBy('value', descending: false)
          .get();

      return Right(data.docs);
    } catch (e) {
      return const Left('There Was an Error, please try again');
    }
  }

  @override
  Future<Either> signin(UserSigninReqModel userSignin) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userSignin.email!,
        password: userSignin.password!,
      );

      return const Right('Sign In was successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }

      return Left(message);
    } catch (e) {
      return const Left('There Was an Error, please try again');
    }
  }
}
