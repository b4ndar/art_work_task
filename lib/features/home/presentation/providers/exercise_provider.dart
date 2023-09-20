/// packages
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


/// imports
import '../../home.dart';

class ExerciseProvider extends ChangeNotifier {
  late final FirebaseException _firebaseException;
  final GetExerciseUseCase? getExerciseUseCase;

  List<ExerciseEntity> exercises = [];

  ExerciseProvider(this.getExerciseUseCase);

  Future<void> fetchExercises() async {
    try {
      exercises = await getExerciseUseCase!.call();
      notifyListeners();
    } catch (e) {
      // Handle any errors or exceptions that may occur during the fetch
      log("Error fetching exercises: $e");
    }
  }

}
