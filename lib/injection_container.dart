

import 'package:get_it/get_it.dart';
import 'core/data_sources/remote.dart';
import 'features/auth/data/auth_data.dart';
import 'features/auth/domain/auth_domain.dart';
import 'features/auth/presentation/widgets/auth_widgets.dart';
import 'features/home/home.dart';
import 'features/home/presentation/exercise.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  print('init');
  final ExerciseRepositoryImpl exerciseRepository = ExerciseRepositoryImpl();
  final AuthenticationRepositoryImpl authenticationRepositoryImpl = AuthenticationRepositoryImpl();
  final GetExerciseUseCase getExerciseUseCase = GetExerciseUseCase(exerciseRepository);
  /// usecase
  final LoginUseCase loginUseCase = LoginUseCase(authenticationRepositoryImpl);
  final LogOutUseCase logOutUseCase = LogOutUseCase(authenticationRepositoryImpl);
  final GetCurrentUserUseCase getCurrentUserUseCase = GetCurrentUserUseCase(authenticationRepositoryImpl);

  sl.registerSingleton<FirebaseHelper>(
    FirebaseHelper(),
  );

  sl.registerSingleton<ExerciseRepository>(
    ExerciseRepositoryImpl(),
  );

  sl.registerSingleton<AuthenticationRepository>(
    AuthenticationRepositoryImpl(),
  );

  // use cases
  sl.registerSingleton<GetExerciseUseCase>(GetExerciseUseCase(sl()));
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));
  sl.registerSingleton<LogOutUseCase>(LogOutUseCase(sl()));
  sl.registerSingleton<GetCurrentUserUseCase>(GetCurrentUserUseCase(sl()));
  // providers
  sl.registerSingleton<ExerciseProvider>(ExerciseProvider(getExerciseUseCase));
  sl.registerSingleton<AuthenticationProvider>(AuthenticationProvider(loginUseCase,logOutUseCase,getCurrentUserUseCase));
}
