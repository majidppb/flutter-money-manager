import 'category.dart';

class ItemSummary {
  final Category category;
  final double amount;
  final double percentage;

  const ItemSummary(
      {required this.category, required this.amount, required this.percentage});
}
