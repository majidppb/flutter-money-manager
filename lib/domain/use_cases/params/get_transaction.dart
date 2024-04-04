import '../../../core/use_case.dart';

final class GetTransactionParams extends Params {
  final String id;

  const GetTransactionParams({required this.id});
}
