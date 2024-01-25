import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case.dart';
import '../../../../../domain/entities/transaction.dart';
import '../../../../../domain/use_cases/get_transactions.dart';

part 'transactions_state.dart';
part 'transactions_cubit.freezed.dart';

@injectable
class TransactionsCubit extends Cubit<TransactionsState> {
  final GetTransactions _getTransactions;

  TransactionsCubit(this._getTransactions) : super(const Loading());

  Future<void> getAllTransactions() async {
    final result = await _getTransactions.call(NoParams());

    emit(result.fold(
      ifLeft: (failure) => const Error(),
      ifRight: (transactions) => Transactions(transactions: transactions),
    ));
  }
}
