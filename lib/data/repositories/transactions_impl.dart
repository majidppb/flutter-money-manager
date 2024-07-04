import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/failure/failure.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/summary.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/enums/category_type.dart';
import '../../domain/repositories/transactions.dart';
import '../data_sources/interfaces/transactions_local_data_source.dart';
import '../data_sources/interfaces/transactions_remote_data_source.dart';
import '../data_sources/mapper/category.dart';
import '../data_sources/mapper/transaction.dart';
import '../exceptions/exceptions.dart';

@LazySingleton(as: TransactionsRepository)
final class TransactionsRepositoryImpl
    with TransactionMapper, CategoryMapper
    implements TransactionsRepository {
  final TransactionsLocalDataSource _cache;
  final TransactionsRemoteDataSource _remote;

  TransactionsRepositoryImpl(this._remote, this._cache) {
    _loadCache();
  }

  Future<void> _loadCache() async {
    await getCategories();
    await getTransactions();
  }

  @override
  Future<Either<Failure, List<Transaction>>> getTransactions() async {
    try {
      // Check in the cache
      final transactionsCache = _cache.getTransactions;
      if (transactionsCache.isNotEmpty) {
        return Right(transactionsCache);
      }

      // Otherwise, load it from remote
      final result = await _remote.getTransactions();
      final transactions = result.map(transactionModelToEntity).toList();

      _cache.setTransactionsCache(transactions);

      return Right(transactions);
    } on ServerException {
      return const Left(Failure.serverFailure());
    } catch (_) {
      return const Left(Failure.clientFailure());
    }
  }

  @override
  Category getCategory(String id) {
    try {
      return _cache.getCategory(id);
    } on ItemNotFoundInCache {
      getCategories();
      return const Category(
          id: '0', name: 'unknown', type: CategoryType.expense);
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      // cache
      final categoriesCache = _cache.getCategories;
      if (categoriesCache.isNotEmpty) {
        return Right(categoriesCache);
      }

      // remote
      final result = await _remote.getCategories();
      final categories = result.map(categoryModelToEntity).toList();

      _cache.setCategoriesCache(categories);

      return Right(categories);
    } on ServerException {
      return const Left(Failure.serverFailure());
    } catch (_) {
      return const Left(Failure.clientFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addTransaction(Transaction transaction) async {
    try {
      await _remote.addTransaction(transactionEntityToModel(transaction));
      _cache.addTransaction(transaction);

      return const Right(null);
    } on ServerException {
      return const Left(Failure.serverFailure());
    } catch (_) {
      return const Left(Failure.clientFailure());
    }
  }

  @override
  Future<Either<Failure, Transaction>> getTransaction(String id) async {
    try {
      // cache
      return Right(_cache.getTransaction(id));
    } on ItemNotFoundInCache {
      // remote
      try {
        final transaction = await _remote.getTransaction(id);
        return Right(transactionModelToEntity(transaction));
      } on ServerException {
        return const Left(Failure.serverFailure());
      }
    } catch (_) {
      return const Left(Failure.clientFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteTransaction(String id) async {
    try {
      await _remote.deleteTransaction(id);
      _cache.deleteTransaction(id);
      return const Right(null);
    } on ServerException {
      return const Left(Failure.serverFailure());
    } catch (_) {
      return const Left(Failure.clientFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateTransaction(
      Transaction transaction) async {
    try {
      await _remote.updateTransaction(transactionEntityToModel(transaction));
      _cache.updateTransaction(transaction);
      return const Right(null);
    } on ServerException {
      return const Left(Failure.serverFailure());
    } catch (_) {
      return const Left(Failure.clientFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addCategory(Category category) async {
    try {
      await _remote.addCategory(categoryEntityToModel(category));
      _cache.addCategory(category);

      return const Right(null);
    } on ServerException {
      return const Left(Failure.serverFailure());
    } catch (_) {
      return const Left(Failure.clientFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteCategory(String id) async {
    try {
      await _remote.deleteCategory(id);
      _cache.deleteCategory(id);
      return const Right(null);
    } on ServerException {
      return const Left(Failure.serverFailure());
    } catch (_) {
      return const Left(Failure.clientFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateCategory(Category category) async {
    try {
      await _remote.updateCategory(categoryEntityToModel(category));
      _cache.updateCategory(category);
      return const Right(null);
    } on ServerException {
      return const Left(Failure.serverFailure());
    } catch (_) {
      return const Left(Failure.clientFailure());
    }
  }

  @override
  Future<Either<Failure, Summary>> getSummary() async {
    try {
      return Right(_cache.getSummary());
    } on ServerException {
      return const Left(Failure.serverFailure());
    } catch (_) {
      return const Left(Failure.clientFailure());
    }
  }
}
