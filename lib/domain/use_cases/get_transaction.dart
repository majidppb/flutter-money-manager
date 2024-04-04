import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../core/use_case.dart';
import '../core/failure/failure.dart';
import '../entities/transaction.dart';
import '../repositories/transactions.dart';
import 'params/get_transaction.dart';

@injectable
class GetTransaction implements UseCase<Transaction, GetTransactionParams> {
  final TransactionsRepository _repo;

  const GetTransaction(this._repo);

  @override
  Future<Either<Failure, Transaction>> call(params) async {
    try {
      return await _repo.getTransaction(params.id);
    } on Exception {
      return const Left(Failure.clientFailure());
    }
  }
}
