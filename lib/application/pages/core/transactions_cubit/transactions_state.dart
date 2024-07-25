part of 'transactions_cubit.dart';

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState.error() = TransactionsStateError;

  const factory TransactionsState.loading() = TransactionsStateLoading;

  const factory TransactionsState.transactions({
    required final Summary summary,
  }) = TransactionsStateLoaded;
}
