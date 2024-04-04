import '../../../core/use_case.dart';

final class DeleteTransactionParams extends Params {
  final String id;

  const DeleteTransactionParams({required this.id});
}
