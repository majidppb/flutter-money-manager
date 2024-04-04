import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/transaction.dart';
import '../../../../domain/enums/category_type.dart';
import '../../../core/colors.dart';
import '../../category/category/category.dart';
import '../../core/utils/error.dart';
import '../../../../core/di/injectable.dart';
import '../../core/utils/shimmer.dart';
import '../../core/utils/skelton.dart';
import '../../settings/settings.dart';
import '../new_or_update_transaction/new_or_update_transaction.dart.dart';
import 'cubit/transactions_cubit.dart';

part 'widgets/_loading.dart';
part 'widgets/_transaction_list.dart';

class TransactionsPageProvider extends StatelessWidget {
  static const icon = Hero(tag: 'transaction', child: Icon(Icons.list_rounded));

  const TransactionsPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TransactionsCubit>(),
      child: const _TransactionsPage(),
    );
  }
}

class _TransactionsPage extends StatelessWidget {
  const _TransactionsPage();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<TransactionsCubit>().getAllTransactions(),
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: TransactionsPageProvider.icon,
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
          if (state is Loading) {
            return const _LoadingWidget();
          }

          if (state is Error) {
            return const CustomErrorWidget();
          }

          return TabBarView(
            children: [
              _TransactionListWidget(
                type: CategoryType.expense,
                transactions: (state as Transactions).expense,
                onUpdate: _onNewOrUpdate,
              ),
              _TransactionListWidget(
                type: CategoryType.income,
                transactions: state.income,
                onUpdate: _onNewOrUpdate,
              ),
            ],
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _onNewOrUpdate(context),
          tooltip: 'New Transaction',
          child: const Icon(Icons.add_rounded),
        ),
      ),
    );
  }

  /// Go to the NewOrUpdateTransaction Page.
  /// Refresh the transactions if there are any changes.
  void _onNewOrUpdate(BuildContext context, {String? id}) {
    Navigator.of(context)
        .push<bool>(MaterialPageRoute(
            builder: (context) => NewOrUpdateTransactionProvider(id: id)))
        .then((isRefreshNeeded) {
      if (isRefreshNeeded == true) {
        context.read<TransactionsCubit>().getAllTransactions();
      }
    });
  }
}
