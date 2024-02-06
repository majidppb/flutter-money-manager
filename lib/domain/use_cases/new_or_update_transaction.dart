import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../core/use_case.dart';
import '../core/failure/failure.dart';
import '../entities/transaction.dart';
import '../repositories/transactions.dart';
import 'params/new_or_update_transaction.dart.dart';

@injectable
class NewOrUpdateTransaction
    implements UseCase<void, NewOrUpdateTransactionParams> {
  final TransactionsRepository _repo;

  NewOrUpdateTransaction(this._repo);

  @override
  Future<Either<Failure, void>> call(params) async {
    try {
      // New / Updated transaction
      final transaction = Transaction(
        id: params.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        purpose: params.purpose,
        amount: params.amount,
        date: params.date,
        category: params.category,
      );

      return params.id == null
          ? _repo.addTransaction(transaction)
          : _repo.updateTransaction(transaction);
    } on Exception {
      return const Left(Failure.clientFailure());
    }
  }
}
