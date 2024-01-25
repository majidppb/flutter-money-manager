import 'package:dart_either/dart_either.dart';
import 'package:money_manager/domain/core/failure/failure.dart';
import 'package:money_manager/domain/entities/transaction.dart';

import '../entities/category.dart';

abstract class TransactionsRepository {
  Future<Either<Failure, List<Transaction>>> getTransactions();
  Future<Either<Failure, List<Category>>> getCategories();
  Category getCategory(int id);
}
