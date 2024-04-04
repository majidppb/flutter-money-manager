import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../core/use_case.dart';
import '../core/failure/failure.dart';
import '../repositories/auth_service.dart';

@injectable
class SignOut implements UseCase<void, NoParams> {
  final AuthService _authService;

  const SignOut(this._authService);

  @override
  Future<Either<Failure, void>> call(_) async {
    try {
      await _authService.signOut();
      return const Right(null);
    } on Exception {
      return const Left(Failure.clientFailure());
    }
  }
}
