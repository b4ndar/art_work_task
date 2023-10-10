/// packages
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../../../core/error/failures.dart';

/// imports
import '../../home.dart';

class ExerciseProvider extends ChangeNotifier {
  late final FirebaseException _firebaseException;
  final GetExerciseUseCase? getExerciseUseCase;

  List<ExerciseEntity> exercises = [];

  ExerciseProvider(this.getExerciseUseCase);

  Future<Either<Failure, List<ExerciseEntity>?>> fetchExercises() async {
    final result = await getExerciseUseCase!.call();
    return result.fold((l) => Left(Failure(l.toString())), (r) {
      exercises = r!;
      notifyListeners();
      return Right(r);
    });
  }
}
