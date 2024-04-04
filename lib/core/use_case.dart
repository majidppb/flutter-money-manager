import 'package:dart_either/dart_either.dart';

import '../../domain/core/failure/failure.dart';

abstract interface class UseCase<T, Param extends Params> {
  Future<Either<Failure, T>> call(Param params);
}

/// Parameters for [UseCase]
abstract base class Params {
  const Params();
}

/// No Parameters for [UseCase]
final class NoParams extends Params {
  const NoParams._();
}

/// No Parameters for [UseCase]
const noParams = NoParams._();
