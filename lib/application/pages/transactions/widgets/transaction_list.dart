import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/transaction.dart';
import '../../../../domain/enums/category_type.dart';
import '../../../core/colors.dart';
import '../../core/transactions_cubit/transactions_cubit.dart';

class TransactionListWidget extends StatelessWidget {
  final CategoryType type;
  final void Function(BuildContext context, {String? id}) onUpdate;
  final List<Transaction> transactions;

  const TransactionListWidget(
      {super.key,
      required this.type,
      required this.transactions,
      required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return Slidable(
          key: Key(transaction.id),
          startActionPane: ActionPane(
            motion: const BehindMotion(),
            children: [
              TextButton.icon(
                onPressed: () =>
                    context.read<TransactionsCubit>().delete(transaction.id),
                icon: const Icon(Icons.delete_forever),
                label: const Text('Delete'),
              )
            ],
          ),
          child: ListTile(
            onTap: () => onUpdate(context, id: transaction.id),
            leading: CircleAvatar(
                backgroundColor:
                    type == CategoryType.expense ? kExpenseColor : kIncomeColor,
                radius: 50,
                child: Text(
                  DateFormat.MMMd().format(transaction.date),
                  textAlign: TextAlign.center,
                )),
            title: Text(transaction.amount.toString()),
            subtitle:
                Text('${transaction.category.name}: ${transaction.purpose}'),
          ),
        );
      },
      separatorBuilder: (ctx, index) {
        return const Divider();
      },
      itemCount: transactions.length,
    );
  }
}