/// imports
import 'package:art_work/features/auth/data/models/login_model.dart';
import 'package:art_work/features/auth/domain/repositories/auth_repository.dart';
import '../../../../core/usecase.dart';
/// packages
import 'package:firebase_auth/firebase_auth.dart';

class LoginUseCase implements UseCase<User?,LoginCredentials?> {
  final AuthenticationRepository authenticationRepository;

  LoginUseCase(this.authenticationRepository);

  @override
  Future<User?> call({LoginCredentials? params}) async{
    print("w");
      final User? user = await authenticationRepository.signInWithEmailAndPassword(params!);
      return user;
  }
}