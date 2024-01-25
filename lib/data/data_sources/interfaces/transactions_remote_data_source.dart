import '../../models/transaction_model.dart';
import '../../models/category_model.dart';

abstract class TransactionsRemoteDataSource {
  Future<List<TransactionModel>> getTransactions();
  Future<List<CategoryModel>> getCategories();
}
