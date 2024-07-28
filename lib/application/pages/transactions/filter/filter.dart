import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injectable.dart';
import '../../../../domain/entities/category.dart';
import '../../../../domain/entities/transaction.dart';
import '../widgets/transaction_list.dart';
import 'cubit/filter_cubit.dart';

class FilterTransactionPageProvider extends StatelessWidget {
  const FilterTransactionPageProvider(
      {super.key,
      required this.onUpdate,
      required this.transactions,
      required this.category});

  final void Function(BuildContext, {String? id}) onUpdate;
  final List<Transaction> transactions;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) =>
          getIt<FilterCubit>()..getFilteredValues(transactions, category),
      child: _FilterTransactionsPage(onUpdate),
    );
  }
}

class _FilterTransactionsPage extends StatelessWidget {
  const _FilterTransactionsPage(this.onUpdate);

  final void Function(BuildContext, {String? id}) onUpdate;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        return Scaffold(
          body: state.transactions.isNotEmpty
              ? TransactionListWidget(
                  type: state.type!,
                  transactions: state.transactions,
                  onUpdate: onUpdate,
                )
              : const Center(
                  child: Text('No items to show!'),
                ),
        );
      },
    );
  }
}
