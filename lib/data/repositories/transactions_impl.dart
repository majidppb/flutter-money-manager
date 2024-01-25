import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/failure/failure.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/repositories/transactions.dart';
import '../data_sources/interfaces/transactions_local_data_source.dart';
import '../data_sources/interfaces/transactions_remote_data_source.dart';
import '../data_sources/mapper/category.dart';
import '../data_sources/mapper/transaction.dart';
import '../exceptions/exceptions.dart';

@Singleton(as: TransactionsRepository)
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

      _cache.setTransactions(transactions);

      return Right(transactions);
    } on ServerException {
      return const Left(Failure.serverFailure());
    } catch (_) {
      return const Left(Failure.clientFailure());
    }
  }

  @override
  Category getCategory(int id) {
    try {
      return _cache.getCategory(id);
    } on Exception {
      getCategories();
      return Category(id: 0, name: 'unknown', type: CategoryType.expense);
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

      _cache.setCategories(categories);

      return Right(categories);
    } on ServerException {
      return const Left(Failure.serverFailure());
    } catch (_) {
      return const Left(Failure.clientFailure());
    }
  }
}
