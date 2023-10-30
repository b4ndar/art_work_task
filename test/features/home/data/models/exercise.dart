import 'package:art_work/features/home/domain/entities/exercise.dart';

class ExerciseModel extends ExerciseEntity {
  const ExerciseModel({required super.title, required super.icon});

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      title: json['title'],
      icon: json['icon'],
    );
  }
}
