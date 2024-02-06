import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case.dart';
import '../../../../../domain/entities/category.dart';
import '../../../../../domain/entities/transaction.dart';
import '../../../../../domain/use_cases/delete_transaction.dart';
import '../../../../../domain/use_cases/get_transactions.dart';
import '../../../../../domain/use_cases/params/delete_transaction.dart';

part 'transactions_state.dart';
part 'transactions_cubit.freezed.dart';

@injectable
class TransactionsCubit extends Cubit<TransactionsState> {
  final GetTransactions _getTransactions;
  final DeleteTransaction _deleteTransaction;

  TransactionsCubit(this._getTransactions, this._deleteTransaction)
      : super(const Loading());

  Future<void> getAllTransactions() async {
    final result = await _getTransactions.call(noParams);

    emit(
      result.fold(
        ifLeft: (failure) => const Error(),
        ifRight: (transactions) {
          return Transactions(
            expense: transactions
                .where((transaction) =>
                    transaction.category.type == CategoryType.expense)
                .toList(),
            income: transactions
                .where((transaction) =>
                    transaction.category.type == CategoryType.income)
                .toList(),
          );
        },
      ),
    );
  }

  Future<void> delete(String id) async {
    final result =
        await _deleteTransaction.call(DeleteTransactionParams(id: id));

    result.fold(
      ifLeft: (failure) => null,
      ifRight: (success) => getAllTransactions(),
    );
  }
}
