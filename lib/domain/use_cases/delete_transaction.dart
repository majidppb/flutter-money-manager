import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../core/use_case.dart';
import '../core/failure/failure.dart';
import '../repositories/transactions.dart';
import 'params/delete_transaction.dart';

@injectable
class DeleteTransaction implements UseCase<void, DeleteTransactionParams> {
  final TransactionsRepository _repo;

  DeleteTransaction(this._repo);

  @override
  Future<Either<Failure, void>> call(params) async {
    try {
      return await _repo.deleteTransaction(params.id);
    } on Exception {
      return const Left(Failure.clientFailure());
    }
  }
}
