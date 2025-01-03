import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_store/core/utils/constants/firebase_constants.dart';
import 'package:online_store/features/auth/data/models/user_creation_req_model.dart';
import 'package:online_store/features/auth/data/models/user_signin_req_model.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserCreationReqModel userCreation);
  Future<Either> signin(UserSigninReqModel userSignin);

  Future<Either> signOut();
  Future<Either> getAges();
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getCurrentUser();
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

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right('Password reset email sent');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'The email address is invalid.';
      } else if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      }

      return Left(message);
    } catch (e) {
      return const Left('There Was an Error, please try again');
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    return FirebaseAuth.instance.currentUser != null;
  }

  @override
  Future<Either> getCurrentUser() async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      var userData = await FirebaseFirestore.instance
          .collection(FirebaseConstants.userCollection)
          .doc(currentUser?.uid)
          .get()
          .then(
            (value) => value.data(),
          );

      if (userData != null) {
        return Right(userData);
      } else {
        return const Left('User not found');
      }
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> signOut() async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        return const Left('User not logged in');
      }

      // await FirebaseFirestore.instance
      //     .collection(FirebaseConstants.userCollection)
      //     .doc(currentUser.uid)
      //     .delete();

      await FirebaseAuth.instance.signOut();

      return const Right('Sign Out was successful');
    } catch (e) {
      return const Left('An error occurred while signing out');
    }
  }
}
