import 'package:injectable/injectable.dart';

import '../../../domain/entities/category.dart';
import '../../../domain/entities/transaction.dart';
import '../interfaces/transactions_local_data_source.dart';

@Injectable(as: TransactionsLocalDataSource)
final class MemoryCache implements TransactionsLocalDataSource {
  final _categories = <Category>[];
  final _transactions = <Transaction>[];

  @override
  List<Transaction> get getTransactions => _transactions;

  @override
  void setTransactions(List<Transaction> transactions) {
    _transactions.clear();
    _transactions.addAll(transactions);
  }

  @override
  List<Category> get getCategories => _categories;

  @override
  void setCategories(List<Category> categories) {
    _categories.clear();
    _categories.addAll(categories);
  }

  @override
  Category getCategory(int id) =>
      _categories.firstWhere((category) => category.id == id);
}
