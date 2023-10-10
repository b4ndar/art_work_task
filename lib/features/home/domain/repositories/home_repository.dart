import 'package:art_work/features/home/domain/entities/exercise.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class ExerciseRepository {
  Future<Either<Failure,List<ExerciseEntity>?>> getExercises();
}