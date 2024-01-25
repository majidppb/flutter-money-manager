import 'package:injectable/injectable.dart';

import '../../models/category_model.dart';
import '../../models/transaction_model.dart';
import '../interfaces/transactions_remote_data_source.dart';

@Injectable(as: TransactionsRemoteDataSource)
final class TransactionsRemoteDataSourceImpl
    implements TransactionsRemoteDataSource {
  @override
  Future<List<TransactionModel>> getTransactions() async {
    await Future.delayed(const Duration(seconds: 5));

    return List.generate(
      10,
      (index) => TransactionModel(
        id: index.toString(),
        purpose: 'Purpose ${index + 1}',
        amount: index * 5,
        date: DateTime.now(),
        category: index % 4,
      ),
    );
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    return List.generate(
      4,
      (index) => CategoryModel(
        id: index,
        name: 'Category $index',
        type: index % 2 == 0 ? 'i' : 'e',
      ),
    );
  }
}
