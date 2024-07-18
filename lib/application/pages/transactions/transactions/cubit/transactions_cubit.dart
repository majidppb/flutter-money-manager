import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/transaction.dart';
import '../../../../../domain/enums/category_type.dart';
import '../../../../../domain/use_cases/delete_transaction.dart';
import '../../../../../domain/use_cases/get_transactions.dart';
import '../../../../../domain/use_cases/params/delete_transaction.dart';
import '../../../../../domain/use_cases/params/get_transactions.dart';

part 'transactions_state.dart';
part 'transactions_cubit.freezed.dart';

@injectable
class TransactionsCubit extends Cubit<TransactionsState> {
  final GetTransactions _getTransactions;
  final DeleteTransaction _deleteTransaction;
  static DateTimeRange? _prevRange;

  TransactionsCubit(this._getTransactions, this._deleteTransaction)
      : super(const Loading());

  Future<void> getAllTransactions(
      {DateTimeRange? range, bool refresh = false}) async {
    final result = refresh
        ? await _getTransactions.call(GetTransactionsParams(range: range))
        : await _getTransactions.call(GetTransactionsParams(range: _prevRange));

    if (refresh) {
      _prevRange = range;
    }

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
      ifLeft: (failure) {},
      ifRight: (success) {
        getAllTransactions(refresh: true);
      },
    );
  }
}
