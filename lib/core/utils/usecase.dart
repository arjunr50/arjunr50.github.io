import 'package:dartz/dartz.dart';
import 'package:portfolio/core/network/failure.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}