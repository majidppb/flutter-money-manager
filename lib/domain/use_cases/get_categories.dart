import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../core/use_case.dart';
import '../core/failure/failure.dart';
import '../entities/category.dart';
import '../repositories/transactions.dart';

@injectable
class GetCategories implements UseCase<List<Category>, NoParams> {
  final TransactionsRepository _repo;

  const GetCategories(this._repo);

  @override
  Future<Either<Failure, List<Category>>> call(_) async {
    try {
      return await _repo.getCategories();
    } on Exception {
      return const Left(Failure.clientFailure());
    }
  }
}
