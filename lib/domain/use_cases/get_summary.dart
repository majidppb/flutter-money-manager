import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../core/use_case.dart';
import '../core/failure/failure.dart';
import '../entities/summary.dart';
import '../repositories/transactions.dart';

@injectable
class GetSummary implements UseCase<Summary, NoParams> {
  final TransactionsRepository _repo;

  const GetSummary(this._repo);

  @override
  Future<Either<Failure, Summary>> call(params) async {
    try {
      return await _repo.getSummary();
    } on Exception {
      return const Left(Failure.clientFailure());
    }
  }
}
