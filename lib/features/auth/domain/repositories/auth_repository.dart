import 'package:art_work/features/auth/data/models/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failures.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, User?>> signInWithEmailAndPassword(LoginCredentials loginCredentials);
  Future<Either<Failure, User?>> getCurrentUser();
  Future<Either<Failure, void>> signOut();
}
