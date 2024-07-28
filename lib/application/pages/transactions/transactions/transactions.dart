import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/transaction.dart';
import '../../category/category/category.dart';
import '../../core/widgets/error.dart';
import '../../core/widgets/shimmer.dart';
import '../../core/widgets/skelton.dart';
import '../../settings/settings.dart';
import '../filter/widgets/filter_bottom_sheet.dart';
import '../new_or_update_transaction/new_or_update_transaction.dart.dart';
import '../../core/transactions_cubit/transactions_cubit.dart';
import '../search/search.dart';
import '../widgets/transaction_list.dart';

part 'widgets/_loading.dart';

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
          leadingWidth: 100,
          leading: Row(
            children: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      final transactions = context
                              .read<TransactionsCubit>()
                              .state is TransactionsStateLoaded
                          ? (context.read<TransactionsCubit>().state
                                      as TransactionsStateLoaded)
                                  .summary
                                  .expenses +
                              (context.read<TransactionsCubit>().state
                                      as TransactionsStateLoaded)
                                  .summary
                                  .incomes
                          : const <Transaction>[];
                      return FilterBottomSheetWidget(
                        onUpdate: _onNewOrUpdate,
                        transactions: transactions,
                      );
                    },
                  );
                },
                icon: const Icon(Icons.filter_alt_rounded),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return SearchPageProvider(onUpdate: _onNewOrUpdate);
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.search_rounded),
              ),
            ],
          ),
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
            ),
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
              TransactionListWidget(
                transactions:
                    (state as TransactionsStateLoaded).summary.expenses,
                onUpdate: _onNewOrUpdate,
              ),
              TransactionListWidget(
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
