import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../statistics/statistics.dart';
import '../transactions/new_or_update_transaction/new_or_update_transaction.dart.dart';
import '../core/transactions_cubit/transactions_cubit.dart';
import '../transactions/transactions/transactions.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  static const _items = [
    NavigationDestination(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.list),
      label: 'Transactions',
    ),
  ];

  static const _pages = IndexedStack(
    children: [
      StatisticsPageProvider(),
      TransactionsPage(),
    ],
  );

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  int _index = 0;

  void _onTap(newIndex) => setState(() {
        _index = newIndex;
      });

  /// Go to the NewOrUpdateTransaction Page.
  /// Refresh the transactions if there are any changes.
  void _onNewOrUpdate(BuildContext context, {String? id}) {
    Navigator.of(context)
        .push<bool>(MaterialPageRoute(
            builder: (context) => NewOrUpdateTransactionProvider(id: id)))
        .then((isRefreshNeeded) {
      if (isRefreshNeeded == true && context.mounted) {
        context.read<TransactionsCubit>().getAllTransactions(refresh: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavBarPage._pages.children[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        destinations: NavBarPage._items,
        onDestinationSelected: _onTap,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onNewOrUpdate(context),
        tooltip: 'New Transaction',
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
