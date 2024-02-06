import '../../../domain/entities/category.dart';
import '../../../domain/entities/transaction.dart';

abstract class TransactionsLocalDataSource {
  // Transaction
  void setTransactionsCache(List<Transaction> transactions);

  List<Transaction> get getTransactions;
  Transaction getTransaction(String id);
  void addTransaction(Transaction transaction);
  void updateTransaction(Transaction transaction);
  void deleteTransaction(String id);

  // Category
  void setCategoriesCache(List<Category> categories);

  List<Category> get getCategories;
  Category getCategory(int id);
  void addCategory(Category category);
  void updateCategory(Category category);
  void deleteCategory(int id);
}
