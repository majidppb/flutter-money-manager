import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../core/use_case.dart';
import '../core/failure/failure.dart';
import '../entities/app_user.dart';
import '../repositories/auth_service.dart';

@injectable
class GetUser implements UseCase<AppUser, NoParams> {
  final AuthService _authService;

  const GetUser(this._authService);

  @override
  Future<Either<Failure, AppUser>> call(_) async {
    try {
      return await _authService.getUser();
    } on Exception {
      return const Left(Failure.clientFailure());
    }
  }
}
