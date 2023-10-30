/// imports
import 'package:art_work/features/auth/data/models/login_model.dart';
import 'package:art_work/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase.dart';
/// packages
import 'package:firebase_auth/firebase_auth.dart';


class GetCurrentUserUseCase implements UseCase<User?,LoginCredentials?> {
  final AuthenticationRepository authenticationRepository;

  GetCurrentUserUseCase(this.authenticationRepository);

  @override
  Future<Either<Failure, User?>> call({params}) async{
    print("getCurrentUser");
    final user = await authenticationRepository.getCurrentUser();
    return user.fold((l) => Left(l), (r) => Right(r));
  }
}