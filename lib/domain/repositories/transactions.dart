import 'package:dart_either/dart_either.dart';
import '../core/failure/failure.dart';
import '../entities/transaction.dart';

import '../entities/category.dart';

abstract interface class TransactionsRepository {
  // Transaction
  Future<Either<Failure, List<Transaction>>> getTransactions();
  Future<Either<Failure, Transaction>> getTransaction(String id);
  Future<Either<Failure, void>> addTransaction(Transaction transaction);
  Future<Either<Failure, void>> updateTransaction(Transaction transaction);
  Future<Either<Failure, void>> deleteTransaction(String id);

  // Category
  Future<Either<Failure, List<Category>>> getCategories();
  Category getCategory(String id);
  Future<Either<Failure, void>> addCategory(Category category);
  Future<Either<Failure, void>> updateCategory(Category category);
  Future<Either<Failure, void>> deleteCategory(String id);
}
