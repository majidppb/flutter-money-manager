import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/transaction.dart';
import '../../../../domain/enums/category_type.dart';
import '../../../core/colors.dart';
import '../../category/category/category.dart';
import '../../core/widgets/error.dart';
import '../../core/widgets/shimmer.dart';
import '../../core/widgets/skelton.dart';
import '../../settings/settings.dart';
import '../new_or_update_transaction/new_or_update_transaction.dart.dart';
import '../../core/transactions_cubit/transactions_cubit.dart';

part 'widgets/_loading.dart';
part 'widgets/_transaction_list.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  /// Go to the NewOrUpdateTransaction Page.
  /// Refresh the transactions if there are any changes.
  void _onNewOrUpdate(BuildContext context, {String? id}) {
    Navigator.of(context)
        .push<bool>(MaterialPageRoute(
            builder: (context) => NewOrUpdateTransactionProvider(id: id)))
        .then((isRefreshNeeded) {
      if (isRefreshNeeded == true) {
        context.read<TransactionsCubit>().getAllTransactions(refresh: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<TransactionsCubit>().getAllTransactions(),
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Transactions'),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CategoryProvider(),
              )),
              icon: CategoryProvider.icon,
            ),
            IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingsProvider())),
              icon: SettingsProvider.icon,
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Expense'),
              Tab(text: 'Income'),
            ],
          ),
        ),
        body: BlocBuilder<TransactionsCubit, TransactionsState>(
            builder: (context, state) {
          if (state is TransactionsStateLoading) {
            return const _LoadingWidget();
          }

          if (state is TransactionsStateError) {
            return const CustomErrorWidget();
          }

          return TabBarView(
            children: [
              _TransactionListWidget(
                type: CategoryType.expense,
                transactions:
                    (state as TransactionsStateLoaded).summary.expenses,
                onUpdate: _onNewOrUpdate,
              ),
              _TransactionListWidget(
                type: CategoryType.income,
                transactions: state.summary.incomes,
                onUpdate: _onNewOrUpdate,
              ),
            ],
          );
        }),
      ),
    );
  }
}
