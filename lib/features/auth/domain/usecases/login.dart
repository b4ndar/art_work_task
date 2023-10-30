/// imports
import 'package:art_work/features/auth/data/models/login_model.dart';
import 'package:art_work/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

/// packages
import 'package:firebase_auth/firebase_auth.dart';

abstract class UseCase<Type,Params> {
  Future<Either<Failure, User?>>  call({Params params});
}

class LoginUseCase implements UseCase<User?,LoginCredentials?> {
  final AuthenticationRepository authenticationRepository;

  LoginUseCase(this.authenticationRepository);

  @override
  Future<Either<Failure, User?>>  call({LoginCredentials? params}) async{
    print("w");
    try {
      final result = await authenticationRepository.signInWithEmailAndPassword(params!);
      return result;
    } catch (e) {
      return Left(Failure(e.toString())); // Handle exceptions and convert to Failure
    }
  }
}