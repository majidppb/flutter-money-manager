import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../../core/di/injectable.dart';
import '../../../domain/repositories/auth_service.dart';
import '../../exceptions/exceptions.dart';
import '../../models/category_model.dart';
import '../../models/transaction_model.dart';
import '../interfaces/transactions_remote_data_source.dart';

@Injectable(as: TransactionsRemoteDataSource)
final class TransactionsRemoteDataSourceImpl
    implements TransactionsRemoteDataSource {
  static const _categories = 'categories';
  static const _transactions = 'transactions';

  @override
  Future<List<TransactionModel>> getTransactions() async {
    return FirebaseFirestore.instance
        .collection(_transactions)
        .where('user', isEqualTo: getIt<AuthService>().userId)
        .get()
        .then(
          (result) => result.docs
              .map((e) => TransactionModel.fromJson(e.data()))
              .toList()
            ..sort((a, b) => b.date.compareTo(a.date)),
        );
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    return FirebaseFirestore.instance
        .collection(_categories)
        .where('user', isEqualTo: getIt<AuthService>().userId)
        .get()
        .then(
          (result) =>
              result.docs.map((e) => CategoryModel.fromJson(e.data())).toList(),
        );
  }

  @override
  Future<void> addTransaction(TransactionModel transaction) async {
    await FirebaseFirestore.instance
        .collection(_transactions)
        .doc(transaction.id)
        .set(transaction.toJson())
        .catchError((error) => throw const ServerException());
  }

  @override
  Future<void> deleteCategory(String id) async {
    await FirebaseFirestore.instance
        .collection(_categories)
        .doc(id)
        .delete()
        .catchError((error) => throw const ServerException());
  }

  @override
  Future<void> deleteTransaction(String id) async {
    await FirebaseFirestore.instance
        .collection(_transactions)
        .doc(id)
        .delete()
        .catchError((error) => throw const ServerException());
  }

  @override
  Future<void> addCategory(CategoryModel category) async {
    await FirebaseFirestore.instance
        .collection(_categories)
        .doc(category.id)
        .set(category.toJson())
        .catchError((error) => throw const ServerException());
  }

  @override
  Future<TransactionModel> getTransaction(String id) async {
    return FirebaseFirestore.instance
        .collection(_transactions)
        .doc(id)
        .get()
        .then((result) => TransactionModel.fromJson(result.data()!))
        .catchError((error) => throw const ServerException());
  }

  @override
  Future<void> updateCategory(CategoryModel category) async {
    await FirebaseFirestore.instance
        .collection(_categories)
        .doc(category.id)
        .update(category.toJson())
        .catchError((error) => throw const ServerException());
  }

  @override
  Future<void> updateTransaction(TransactionModel transaction) async {
    await FirebaseFirestore.instance
        .collection(_transactions)
        .doc(transaction.id)
        .update(transaction.toJson())
        .catchError((error) => throw const ServerException());
  }
}
