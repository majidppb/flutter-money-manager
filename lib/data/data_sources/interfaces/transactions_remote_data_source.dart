import '../../models/transaction_model.dart';
import '../../models/category_model.dart';

abstract interface class TransactionsRemoteDataSource {
  // Transaction
  Future<List<TransactionModel>> getTransactions();
  Future<TransactionModel> getTransaction(String id);
  Future<void> addTransaction(TransactionModel transaction);
  Future<void> updateTransaction(TransactionModel transaction);
  Future<void> deleteTransaction(String id);

  // Category
  Future<List<CategoryModel>> getCategories();
  Future<void> addCategory(CategoryModel category);
  Future<void> updateCategory(CategoryModel category);
  Future<void> deleteCategory(String id);
}
