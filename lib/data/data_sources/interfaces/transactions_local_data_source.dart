import 'package:flutter/material.dart';

import '../../../domain/entities/category.dart';
import '../../../domain/entities/transaction.dart';

abstract interface class TransactionsLocalDataSource {
  // Transaction
  void setTransactionsCache(List<Transaction> transactions);

  List<Transaction> getTransactions({DateTimeRange? range});
  bool get isEmpty;
  Transaction getTransaction(String id);
  void addTransaction(Transaction transaction);
  void updateTransaction(Transaction transaction);
  void deleteTransaction(String id);

  // Category
  void setCategoriesCache(List<Category> categories);

  List<Category> get getCategories;
  Category getCategory(String id);
  void addCategory(Category category);
  void updateCategory(Category category);
  void deleteCategory(String id);
}
