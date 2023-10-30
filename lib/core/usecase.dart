import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'error/failures.dart';

abstract class UseCase<Type,Params> {
   Future<Either<Failure, Type?>> call({Params params});
}