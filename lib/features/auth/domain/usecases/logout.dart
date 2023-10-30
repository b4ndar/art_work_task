/// imports
import 'package:art_work/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase.dart';

class LogOutUseCase implements UseCase<void,void> {
  final AuthenticationRepository authenticationRepository;

  LogOutUseCase(this.authenticationRepository);

  @override
  Future<Either<Failure, String?>> call({void params}) async{
    print("f");
     final result = await authenticationRepository.signOut();
     return result.fold((l) => Left(Failure('Sign out Failed')), (r) => const Right('Success'));
  }
}