/// imports
import 'package:art_work/features/auth/domain/repositories/auth_repository.dart';
import '../../../../core/usecase.dart';

class LogOutUseCase implements UseCase<void,void> {
  final AuthenticationRepository authenticationRepository;

  LogOutUseCase(this.authenticationRepository);

  @override
  Future<void> call({void params}) async{
    print("w");
     await authenticationRepository.signOut();
  }
}