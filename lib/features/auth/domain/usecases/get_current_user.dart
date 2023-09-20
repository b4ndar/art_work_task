/// imports
import 'package:art_work/features/auth/data/models/login_model.dart';
import 'package:art_work/features/auth/domain/repositories/auth_repository.dart';
import '../../../../core/usecase.dart';
/// packages
import 'package:firebase_auth/firebase_auth.dart';


class GetCurrentUserUseCase implements UseCase<User?,LoginCredentials?> {
  final AuthenticationRepository authenticationRepository;

  GetCurrentUserUseCase(this.authenticationRepository);

  @override
  Future<User?> call({params}) async{
    print("getCurrentUser");
    final User? user = await authenticationRepository.getCurrentUser();
    return user;
  }
}