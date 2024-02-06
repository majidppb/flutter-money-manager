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

// sealed class TransactionsState extends Equatable {}

// final class Loading extends TransactionsState {
//   @override
//   List<Object?> get props => [];
// }

// final class Error extends TransactionsState {
//   @override
//   List<Object?> get props => [];
// }

// @immutable
// final class Transactions extends TransactionsState {
//   final List<Transaction> transactions;

//   Transactions({required this.transactions});

//   @override
//   List<Object?> get props => [transactions];
// }
