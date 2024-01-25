import 'category.dart';

final class Transaction {
  final String id;
  final String purpose;
  final double amount;
  final DateTime date;
  final Category category;

  Transaction({
    required this.id,
    required this.purpose,
    required this.amount,
    required this.date,
    required this.category,
  });
}
