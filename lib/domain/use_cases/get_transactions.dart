import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../core/use_case.dart';
import '../core/failure/failure.dart';
import '../entities/transaction.dart';
import '../repositories/transactions.dart';

@injectable
class GetTransactions implements UseCase<List<Transaction>, NoParams> {
  final TransactionsRepository _repo;

  const GetTransactions(this._repo);

  @override
  Future<Either<Failure, List<Transaction>>> call(_) async {
    try {
      return await _repo.getTransactions();
    } on Exception {
      return const Left(Failure.clientFailure());
    }
  }
}
