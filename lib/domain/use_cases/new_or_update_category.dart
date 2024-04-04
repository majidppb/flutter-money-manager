import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../core/use_case.dart';
import '../core/failure/failure.dart';
import '../entities/category.dart';
import '../repositories/transactions.dart';
import 'params/new_or_update_category.dart';

@injectable
class NewOrUpdateCategory implements UseCase<void, NewOrUpdateCategoryParams> {
  final TransactionsRepository _repo;

  const NewOrUpdateCategory(this._repo);

  @override
  Future<Either<Failure, void>> call(params) async {
    try {
      // New / Updated category
      final category = Category(
        id: params.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        name: params.name,
        type: params.type,
      );

      return params.id == null
          ? _repo.addCategory(category)
          : _repo.updateCategory(category);
    } on Exception {
      return const Left(Failure.clientFailure());
    }
  }
}
