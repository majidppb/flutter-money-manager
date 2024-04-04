import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../core/use_case.dart';
import '../core/failure/failure.dart';
import '../entities/category.dart';
import '../repositories/transactions.dart';
import 'params/get_category.dart';

@injectable
class GetCategory implements UseCase<Category, GetCategoryParams> {
  final TransactionsRepository _repo;

  const GetCategory(this._repo);

  @override
  Future<Either<Failure, Category>> call(params) async {
    try {
      return Future.value(Right(_repo.getCategory(params.id)));
    } on Exception {
      return const Left(Failure.clientFailure());
    }
  }
}
