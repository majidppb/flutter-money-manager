import '../../../core/use_case.dart';

final class SearchTransactionParams extends Params {
  final String query;

  const SearchTransactionParams({required this.query});
}
