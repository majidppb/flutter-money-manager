import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../core/use_case.dart';
import '../core/failure/failure.dart';
import '../repositories/transactions.dart';
import 'params/delete_category.dart';

@injectable
class DeleteCategory implements UseCase<void, DeleteCategoryParams> {
  final TransactionsRepository _repo;

  const DeleteCategory(this._repo);

  @override
  Future<Either<Failure, void>> call(params) async {
    try {
      return await _repo.deleteCategory(params.id);
    } on Exception {
      return const Left(Failure.clientFailure());
    }
  }
}
