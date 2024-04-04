import 'package:injectable/injectable.dart';

import '../../../domain/entities/category.dart';
import '../../../domain/entities/transaction.dart';
import '../../exceptions/exceptions.dart';
import '../interfaces/transactions_local_data_source.dart';

@Injectable(as: TransactionsLocalDataSource)
final class MemoryCache implements TransactionsLocalDataSource {
  final _categories = <Category>[];
  final _transactions = <Transaction>[];

  @override
  List<Transaction> get getTransactions => _transactions;

  @override
  void setTransactionsCache(List<Transaction> transactions) {
    _transactions.clear();
    _transactions.addAll(transactions);
  }

  @override
  List<Category> get getCategories => _categories;

  @override
  void setCategoriesCache(List<Category> categories) {
    _categories.clear();
    _categories.addAll(categories);
  }

  @override
  Category getCategory(String id) {
    try {
      return _categories.firstWhere((category) => category.id == id);
    } on Exception {
      throw const ItemNotFoundInCache();
    }
  }

  @override
  void addTransaction(Transaction transaction) =>
      _transactions.add(transaction);

  @override
  void addCategory(Category category) => _categories.add(category);

  @override
  void deleteCategory(String id) =>
      _categories.removeWhere((category) => category.id == id);

  @override
  void deleteTransaction(String id) =>
      _transactions.removeWhere((transaction) => transaction.id == id);

  @override
  Transaction getTransaction(String id) {
    try {
      return _transactions.firstWhere((transaction) => transaction.id == id);
    } on Exception {
      throw const ItemNotFoundInCache();
    }
  }

  @override
  void updateCategory(Category category) {
    final index =
        _categories.indexWhere((element) => element.id == category.id);
    _categories.removeAt(index);
    _categories.insert(index, category);
  }

  @override
  void updateTransaction(Transaction transaction) {
    final index =
        _transactions.indexWhere((element) => element.id == transaction.id);
    _transactions.removeAt(index);
    _transactions.insert(index, transaction);
  }
}
