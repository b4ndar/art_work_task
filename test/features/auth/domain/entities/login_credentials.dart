import 'package:equatable/equatable.dart';

class LoginCredentialsEntity extends Equatable {
  final String? email;
  final String? password;

  const LoginCredentialsEntity({required this.email,required this.password});

  @override
  List<Object?> get props => [email,password];
}