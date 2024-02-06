part of 'new_or_update_transaction_cubit.dart';

enum NewOrUpdateTransactionStatus {
  editing,
  invalid,
  saving,
  saved,
  savingFailed
}

@freezed
class NewOrUpdateTransactionState with _$NewOrUpdateTransactionState {
  const factory NewOrUpdateTransactionState.loading() = Loading;

  const factory NewOrUpdateTransactionState.error() = Error;

  const factory NewOrUpdateTransactionState.loaded({
    @Default(NewOrUpdateTransactionStatus.editing)
    final NewOrUpdateTransactionStatus status,
    final String? purpose,
    final double? amount,
    final DateTime? date,
    final CategoryType? type,
    final Category? category,
    @Default([]) final List<Category> categories,
  }) = Loaded;
}
