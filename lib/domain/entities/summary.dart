import 'package:flutter/material.dart';
import 'transaction.dart';

import 'item_summary.dart';

class Summary {
  final DateTimeRange? range;
  final List<Transaction> expenses;
  final List<Transaction> incomes;
  final double expense;
  final double income;
  final List<ItemSummary> summaries;

  const Summary({
    this.range,
    required this.expenses,
    required this.incomes,
    required this.expense,
    required this.income,
    required this.summaries,
  });
}
