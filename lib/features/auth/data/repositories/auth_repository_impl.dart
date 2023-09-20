/// packages
import 'package:art_work/features/auth/data/models/login_model.dart';
import 'package:art_work/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/core.dart';
/// imports




class AuthenticationRepositoryImpl implements AuthenticationRepository {

  final FirebaseHelper _firebaseHelper = FirebaseHelper();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  @override
  Future<User?> signInWithEmailAndPassword(LoginCredentials loginCredentials) async{
    await _firebaseHelper.signIn(loginCredentials.email!, loginCredentials.password!);
    return _firebaseAuth.currentUser;
  }

  @override
  Future<void> signOut() async{
    print("re");
    await _firebaseHelper.signOut();
  }

  @override
  Future<User?> getCurrentUser() async {
    return currentUser;
  }

}