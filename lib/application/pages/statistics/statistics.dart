import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../domain/entities/item_summary.dart';
import '../../../domain/enums/category_type.dart';
import '../../core/colors.dart';
import '../../core/styles.dart';
import '../core/widgets/error.dart';
import '../core/transactions_cubit/transactions_cubit.dart';
import 'cubit/statistics_cubit.dart';

part 'widgets/_bar_chart.dart';
part 'widgets/_pie_chart.dart';

class StatisticsPageProvider extends StatelessWidget {
  const StatisticsPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatisticsCubit(),
      child: const _StatisticsPage(),
    );
  }
}

class _StatisticsPage extends StatelessWidget {
  const _StatisticsPage();

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
            tooltip: 'Pick a date range',
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
              _PieChart(
                income: state.summary.income,
                expense: state.summary.expense,
              ),
              const SizedBox(height: 200),
              BlocBuilder<StatisticsCubit, StatisticsState>(
                builder: (context, statisticsState) {
                  final summaries = state.summary.summaries
                      .where((e) => e.category.type == statisticsState.category)
                      .toList();

                  summaries.sort((a, b) => a.amount.compareTo(b.amount));

                  return _BarChart(items: summaries);
                },
              ),
              kHeight30,
              Padding(
                padding: const EdgeInsets.only(bottom: 80, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        context
                            .read<StatisticsCubit>()
                            .changeCategory(CategoryType.income);
                      },
                      child: const Text('Income'),
                    ),
                    TextButton(
                      onPressed: () {
                        context
                            .read<StatisticsCubit>()
                            .changeCategory(CategoryType.expense);
                      },
                      child: const Text('Expense'),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
