import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/injectable.dart';
import '../../../../../domain/entities/category.dart';
import '../../../../../domain/entities/transaction.dart';
import '../../../../../domain/enums/category_type.dart';
import '../../../../core/styles.dart';
import '../cubit/filter_cubit.dart';
import '../filter.dart';

class FilterBottomSheetWidget extends StatelessWidget {
  const FilterBottomSheetWidget(
      {super.key, required this.onUpdate, required this.transactions});

  final void Function(BuildContext, {String? id}) onUpdate;
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FilterCubit>(),
      child: BlocBuilder<FilterCubit, FilterState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Radio(
                    value: CategoryType.income,
                    groupValue: state.type,
                    onChanged: (newValue) => context
                        .read<FilterCubit>()
                        .valueChanged(type: newValue),
                  ),
                  const Text('Income'),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: CategoryType.expense,
                    groupValue: state.type,
                    onChanged: (newValue) => context
                        .read<FilterCubit>()
                        .valueChanged(type: newValue),
                  ),
                  const Text('Expense'),
                ],
              ),
              // Category
              Padding(
                padding: kScaffoldHPadding,
                child: DropdownButton<Category>(
                  isExpanded: true,
                  hint: const Text('Select a category'),
                  value: state.category,
                  items: state.categories
                      .map((category) => DropdownMenuItem<Category>(
                            value: category,
                            child: Text(category.name),
                          ))
                      .toList(),
                  onChanged: (newValue) => context
                      .read<FilterCubit>()
                      .valueChanged(category: newValue),
                ),
              ),

              kHeight10,

              kHeight10,

              ElevatedButton(
                onPressed: state.category == null
                    ? () {}
                    : () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FilterTransactionPageProvider(
                              onUpdate: onUpdate,
                              transactions: transactions,
                              category: state.category!,
                            ),
                          ),
                        );
                      },
                child: const Text('Filter'),
              ),
            ],
          );
        },
      ),
    );
  }
}
