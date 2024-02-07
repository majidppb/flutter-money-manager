part of 'new_or_update_transaction_cubit.dart';

@freezed
class NewOrUpdateTransactionState with _$NewOrUpdateTransactionState {
  const factory NewOrUpdateTransactionState.loading() = Loading;

  const factory NewOrUpdateTransactionState.error() = Error;

  const factory NewOrUpdateTransactionState.loaded({
    @Default(NewOrUpdateStatus.editing) final NewOrUpdateStatus status,
    final String? purpose,
    final double? amount,
    final DateTime? date,
    final CategoryType? type,
    final Category? category,
    @Default([]) final List<Category> categories,
  }) = Loaded;
}
