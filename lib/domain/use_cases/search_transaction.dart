import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../core/use_case.dart';
import '../core/failure/failure.dart';
import '../entities/transaction.dart';
import '../repositories/transactions.dart';
import 'params/search_transaction.dart';

@injectable
class SearchTransaction
    implements UseCase<List<Transaction>, SearchTransactionParams> {
  final TransactionsRepository _repo;

  const SearchTransaction(this._repo);

  @override
  Future<Either<Failure, List<Transaction>>> call(params) async {
    try {
      return await _repo.searchTransaction(params.query);
    } on Exception {
      return const Left(Failure.clientFailure());
    }
  }
}
