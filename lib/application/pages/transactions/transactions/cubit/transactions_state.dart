part of 'transactions_cubit.dart';

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState.loading() = Loading;
  const factory TransactionsState.error() = Error;
  const factory TransactionsState.transactions({
    required List<Transaction> transactions,
  }) = Transactions;
}
