import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../domain/entities/item_summary.dart';
import '../../core/styles.dart';
import '../core/widgets/error.dart';
import '../core/transactions_cubit/transactions_cubit.dart';

part 'widgets/_bar_chart.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  void _selectRange(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context2) {
        return ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              title: const Text('All'),
              onTap: () {
                context
                    .read<TransactionsCubit>()
                    .getAllTransactions(refresh: true);

                Navigator.of(context2).pop();
              },
            ),
            ListTile(
              title: const Text('Today'),
              onTap: () {
                context.read<TransactionsCubit>().getAllTransactions(
                      range: DateTimeRange(
                        start: DateTime.now(),
                        end: DateTime.now(),
                      ),
                      refresh: true,
                    );

                Navigator.of(context2).pop();
              },
            ),
            ListTile(
              title: const Text('This week'),
              onTap: () {
                context.read<TransactionsCubit>().getAllTransactions(
                    range: DateTimeRange(
                      start: DateTime.now().subtract(const Duration(days: 7)),
                      end: DateTime.now(),
                    ),
                    refresh: true);

                Navigator.of(context2).pop();
              },
            ),
            ListTile(
              title: const Text('This month'),
              onTap: () {
                context.read<TransactionsCubit>().getAllTransactions(
                    range: DateTimeRange(
                      start: DateTime.now().subtract(const Duration(days: 30)),
                      end: DateTime.now(),
                    ),
                    refresh: true);

                Navigator.of(context2).pop();
              },
            ),
            ListTile(
              title: const Text('Pick a date range'),
              onTap: () async {
                showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now().add(const Duration(days: 7)),
                ).then((picked) {
                  if (picked != null) {
                    context
                        .read<TransactionsCubit>()
                        .getAllTransactions(refresh: true, range: picked);
                    Navigator.of(context2).pop();
                  }
                });
              },
            ),
            kHeight50,
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TransactionsCubit>().getAllTransactions();
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Money Manager'),
        actions: [
          IconButton(
            onPressed: () => _selectRange(context),
            icon: const Icon(Icons.calendar_today),
          ),
        ],
      ),
      body: BlocBuilder<TransactionsCubit, TransactionsState>(
        builder: (context, state) {
          if (state is TransactionsStateLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (state is TransactionsStateError) {
            return const CustomErrorWidget();
          }

          return ListView(
            padding: kScaffoldHPadding,
            children: [
              if ((state as TransactionsStateLoaded).summary.range != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Start Date'),
                    Text(
                      DateFormat.yMMMMd().format(state.summary.range!.start),
                    ),
                  ],
                ),
              kHeight10,
              if (state.summary.range != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('End Date'),
                    Text(
                      DateFormat.yMMMMd().format(state.summary.range!.end),
                    ),
                  ],
                ),
              kHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Income'),
                  Text(
                    state.summary.income.toInt().toString(),
                  ),
                ],
              ),
              kHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Expense'),
                  Text(
                    state.summary.expense.toInt().toString(),
                  ),
                ],
              ),
              kHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Balance'),
                  Text(
                    (state.summary.income - state.summary.expense)
                        .toInt()
                        .toString(),
                  ),
                ],
              ),
              const SizedBox(height: 250),
              _BarChart(items: state.summary.summaries),
            ],
          );
        },
      ),
    );
  }
}
