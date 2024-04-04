import '../../../core/use_case.dart';
import '../../entities/category.dart';

final class NewOrUpdateTransactionParams extends Params {
  final String? id;
  final String purpose;
  final double amount;
  final DateTime date;
  final Category category;

  const NewOrUpdateTransactionParams(
      {required this.id,
      required this.purpose,
      required this.amount,
      required this.date,
      required this.category});
}
