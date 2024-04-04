import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../core/use_case.dart';
import '../core/failure/failure.dart';
import '../repositories/auth_service.dart';

@injectable
class SignInWithGoogle implements UseCase<void, NoParams> {
  final AuthService _authService;

  const SignInWithGoogle(this._authService);

  @override
  Future<Either<Failure, void>> call(_) async {
    try {
      final result = await _authService.signInWithGoogle();

      return result.fold(
        ifLeft: (failure) => const Left(Failure.serverFailure()),
        ifRight: (success) => const Right(null),
      );
    } on Exception {
      return const Left(Failure.clientFailure());
    }
  }
}
