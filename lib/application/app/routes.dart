import 'package:flutter/widgets.dart';

import '../pages/category/category.dart';
import '../pages/transactions/transactions/transactions.dart';

final routes = {
  TransactionsPage.path: (BuildContext context) =>
      const TransactionsPageProvider(),
  // NewOrUpdateTransactionPage.path: (BuildContext context) =>
  //     const NewOrUpdateTransactionProvider(),
  CategoryPage.path: (BuildContext context) => const CategoryPageProvider(),
};
