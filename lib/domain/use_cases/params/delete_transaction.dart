import '../../../core/use_case.dart';

final class DeleteTransactionParams extends Params {
  final String id;

  DeleteTransactionParams({required this.id});
}
