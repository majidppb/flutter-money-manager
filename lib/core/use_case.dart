import 'package:dart_either/dart_either.dart';

import '../domain/core/failure/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class Params {}

final class NoParams extends Params {}
