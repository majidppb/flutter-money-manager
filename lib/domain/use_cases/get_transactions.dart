import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../core/use_case.dart';
import '../core/failure/failure.dart';
import '../entities/transaction.dart';
import '../repositories/transactions.dart';
import 'params/get_transactions.dart';

@injectable
class GetTransactions
    implements UseCase<List<Transaction>, GetTransactionsParams> {
  final TransactionsRepository _repo;

  const GetTransactions(this._repo);

  @override
  Future<Either<Failure, List<Transaction>>> call(params) async {
    try {
      return await _repo.getTransactions(range: params.range);
    } on Exception {
      return const Left(Failure.clientFailure());
    }
  }
}
