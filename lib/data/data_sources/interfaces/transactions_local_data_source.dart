import '../../../domain/entities/category.dart';
import '../../../domain/entities/transaction.dart';

abstract class TransactionsLocalDataSource {
  List<Transaction> get getTransactions;
  void setTransactions(List<Transaction> transactions);
  List<Category> get getCategories;
  void setCategories(List<Category> categories);
  Category getCategory(int id);
}
