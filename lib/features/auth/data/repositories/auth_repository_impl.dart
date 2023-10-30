/// packages
import 'package:art_work/features/auth/data/models/login_model.dart';
import 'package:art_work/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/core.dart';
import '../../../../core/error/failures.dart';
/// imports




class AuthenticationRepositoryImpl implements AuthenticationRepository {

  final FirebaseHelper _firebaseHelper = FirebaseHelper();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  @override
  Future<Either<Failure, User?>> signInWithEmailAndPassword(LoginCredentials loginCredentials) async{
    final user = await _firebaseHelper.signIn(loginCredentials.email!, loginCredentials.password!);
    return user.fold((l) => Left(l), (r) => user);
  }

  @override
  Future<Either<Failure, String?>> signOut() async{
    print("dd");
    final result = await _firebaseHelper.signOut();
    return result.fold((l) => Left(Failure('Sign out Failed')), (r) => const Right('Success'));
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    return currentUser != null ? Right(currentUser) : Left(Failure(''));
  }

}