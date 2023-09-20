import 'package:art_work/features/auth/data/models/login_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<User?> signInWithEmailAndPassword(LoginCredentials loginCredentials);
  Future<User?> getCurrentUser();
  Future<void> signOut();
}
