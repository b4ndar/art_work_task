import 'package:art_work/features/home/domain/entities/exercise.dart';

abstract class ExerciseRepository {
  Future<List<ExerciseEntity>> getExercises();
}