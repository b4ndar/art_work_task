// import 'package:art_work/features/auth/domain/usecases/login.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:art_work/features/auth/data/auth_data.dart';
// import 'package:art_work/features/auth/domain/repositories/auth_repository.dart';
// // Mock AuthenticationRepository
// class MockAuthenticationRepository implements AuthenticationRepository {
//   @override
//   Future<User?> signInWithEmailAndPassword(LoginCredentials credentials) async {
//     // Simulate a successful login
//     return User(); // Adjust as needed
//   }
// }
//
// void main() {
//   test('LoginUseCase should return a User on successful login', () async {
//     // Arrange
//     final mockRepository = MockAuthenticationRepository();
//     final loginUseCase = LoginUseCase(mockRepository);
//     final credentials = LoginCredentials(email: 'test@example.com', password: 'password');
//
//     // Act
//     final result = await loginUseCase.call(params: credentials);
//
//     // Assert
//     expect(result, isNotNull); // Ensure the result is not null
//     expect(result!.email, credentials.email); // Ensure the email matches
//   });
//
//   // Add more tests as needed
// }
