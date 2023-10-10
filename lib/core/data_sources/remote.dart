import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../error/auth_exceptions.dart';
import '../error/failures.dart';

 class FirebaseHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign Up with Email and Password

  // Future<User?> signUp(String email, String password) async {
  //   try {
  //     await _auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     return _auth.currentUser;
  //   } catch (e) {
  //     print("Error during sign up: $e");
  //     return null;
  //   }
  // }


  // Sign In with Email and Password
  Future<Either<Failure, User?>> signIn(String email, String password) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(user.user);
    } on FirebaseAuthException catch (error) {
      String errorMessage = AuthExceptionHandler.handleException(error);
      // Handle the error using errorMessage
      return Left(Failure(errorMessage));
    }
  }

  // Sign Out
  Future<Either<Failure, String?>> signOut() async {
    try{
      print("q");
      await _auth.signOut();
      return const Right('Success');
    } on FirebaseAuthException catch (error) {
      String errorMessage = AuthExceptionHandler.handleException(error);
      return Left(Failure(errorMessage));
    }

  }

  // Add data to Firestore
  Future<void> addDataToFirestore(String collectionName, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collectionName).add(data);
    } catch (e) {
      print("Error adding data to Firestore: $e");
    }
  }

  // Read data from Firestore
  Future<List<DocumentSnapshot>> getDataFromFirestore(String collectionName) async {
    try {
      final querySnapshot = await _firestore.collection(collectionName).get();
      return querySnapshot.docs;
    } catch (e) {
      print("Error getting data from Firestore: $e");
      return [];
    }
  }
}
