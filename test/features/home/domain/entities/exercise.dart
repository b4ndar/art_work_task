import 'package:equatable/equatable.dart';

class ExerciseEntity extends Equatable {
  final String? title;
  final String? icon;

  const ExerciseEntity({required this.title, required this.icon});


  @override
  List<Object?> get props => [title,icon];
}
