import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

 class FirebaseHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign Up with Email and Password
  Future<User?> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _auth.currentUser;
    } catch (e) {
      print("Error during sign up: $e");
      return null;
    }
  }

  // Sign In with Email and Password
  Future<User?> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _auth.currentUser;
    } catch (e) {
      print("Error during sign in: $e");
      return null;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    print("re hlper");
    await _auth.signOut();
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
