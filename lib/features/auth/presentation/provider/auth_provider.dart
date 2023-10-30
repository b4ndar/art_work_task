/// imports
import 'package:art_work/features/auth/data/models/login_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/auth_domain.dart';
/// packages
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthenticationProvider extends ChangeNotifier {
  final LoginUseCase? loginUseCase;
  final LogOutUseCase? logOutUseCase;
  final GetCurrentUserUseCase? getCurrentUserUseCase;

  User? user;

  AuthenticationProvider(this.loginUseCase,this.logOutUseCase,this.getCurrentUserUseCase);

  Future<Either<Failure, User?>> login(LoginCredentials loginCredentials) async {
    try {
      final result = await loginUseCase!.call(params: loginCredentials);
      if (result.isRight()) {
        user = result.getOrElse(() => null);
        notifyListeners();
      }
      return result;
    } catch (e) {
      log("Error fetching exercises: $e");
      return Left(Failure(e.toString())); // Convert the exception to a Failure
    }
  }

  Future<void> logOut() async {
    try {
      print("g");
      await logOutUseCase!.call();
      notifyListeners();
    } catch (e) {
      log("Error fetching exercises: $e");
    }
  }

  Future<Either<Failure, User?>> getCurrentUser() async {
    final result = await getCurrentUserUseCase!.call();
    return result.fold((l) => Left(l), (r) => Right(r));
    notifyListeners();
  }

}
