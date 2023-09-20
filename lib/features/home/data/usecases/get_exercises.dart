import '../../../../core/usecase.dart';
import 'package:art_work/features/home/domain/entities/exercise.dart';
import 'package:art_work/features/home/domain/repositories/home_repository.dart';

class GetExerciseUseCase implements UseCase<List<ExerciseEntity>,void> {
  final ExerciseRepository exerciseRepository;

  GetExerciseUseCase(this.exerciseRepository);

  @override
  Future<List<ExerciseEntity>> call({void params})  {
    return exerciseRepository.getExercises();
  }
}