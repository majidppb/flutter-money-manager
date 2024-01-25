import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:money_manager/application/pages/core/widgets/error.dart';

import '../../../../core/di/injectable.dart';
import '../../../../domain/entities/category.dart';
import '../../category/category.dart';
import 'cubit/transactions_cubit.dart';
import 'widgets/transaction_loading.dart';

class TransactionsPageProvider extends StatelessWidget {
  const TransactionsPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TransactionsCubit>(),
      child: const TransactionsPage(),
    );
  }
}

class TransactionsPage extends StatelessWidget {
  static const path = '/transactions';

  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<TransactionsCubit>().getAllTransactions(),
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text('Transactions'),
          actions: [
            TextButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(CategoryPage.path),
                child: const Text('Categories'))
          ],
        ),
        body: BlocBuilder<TransactionsCubit, TransactionsState>(
            builder: (context, state) {
          if (state is Loading) {
            return const TransactionsLoadingWidget();
          }

          if (state is Error) {
            return const Center(child: CustomErrorWidget());
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              final transaction = state.transactions[index];
              return Slidable(
                key: Key(transaction.id),
                startActionPane:
                    ActionPane(motion: const BehindMotion(), children: [
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.delete_forever),
                      label: const Text('Delete'))
                ]),
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundColor:
                          transaction.category.type == CategoryType.expense
                              ? Colors.blueGrey
                              : Colors.lime,
                      radius: 50,
                      child: Text(
                        _parseDate(transaction.date),
                        textAlign: TextAlign.center,
                      )),
                  title: Text(transaction.amount.toString()),
                  subtitle: Text(
                      '${transaction.category.name}: ${transaction.purpose}'),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const Divider();
            },
            itemCount: (state as Transactions).transactions.length,
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          //     Navigator.of(context).pushNamed(NewOrUpdateTransactionPage.path),
          tooltip: 'New Transaction',
          child: const Icon(Icons.add_rounded),
        ));
  }

  String _parseDate(DateTime date) {
    return '${date.day}\n${date.month}';
  }
}
