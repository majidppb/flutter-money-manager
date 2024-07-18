import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../transactions/transactions/cubit/transactions_cubit.dart';

class StatisticsPageProvider extends StatelessWidget {
  const StatisticsPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Money Manager'),
        actions: [
          IconButton(
            onPressed: () async {
              showDateRangePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              ).then((picked) {
                if (picked != null) {
                  context
                      .read<TransactionsCubit>()
                      .getAllTransactions(refresh: true, range: picked);
                }
              });
            },
            icon: const Icon(Icons.filter_list),
          ),
          IconButton(
            onPressed: () {
              context
                  .read<TransactionsCubit>()
                  .getAllTransactions(refresh: true);
            },
            icon: const Icon(Icons.calendar_today),
          ),
        ],
      ),
    );
  }
}
