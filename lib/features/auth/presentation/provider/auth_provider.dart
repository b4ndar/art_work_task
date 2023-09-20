/// imports
import 'package:art_work/features/auth/data/models/login_model.dart';

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

  Future<void> login(LoginCredentials loginCredentials) async {
    try {
      user = await loginUseCase!.call(params: loginCredentials);
      notifyListeners();
    } catch (e) {
      log("Error fetching exercises: $e");
    }
  }

  Future<void> logOut() async {
    try {
      await logOutUseCase!.call();
      notifyListeners();
    } catch (e) {
      log("Error fetching exercises: $e");
    }
  }

  Future<User?> getCurrentUser() async {
    user = await getCurrentUserUseCase!.call();
    notifyListeners();
  }

}
