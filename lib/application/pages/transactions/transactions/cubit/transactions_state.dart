part of 'transactions_cubit.dart';

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState.error() = Error;

  const factory TransactionsState.loading() = Loading;

  const factory TransactionsState.transactions({
    required final List<Transaction> income,
    required final List<Transaction> expense,
  }) = Transactions;
}
