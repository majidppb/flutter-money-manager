import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/di/injectable.dart';
import '../../../../domain/enums/category_type.dart';
import '../../../core/styles.dart';
import '../../../../domain/entities/category.dart';
import '../../core/utils/new_or_update_status.dart';
import '../../core/widgets/error.dart';
import '../../core/widgets/shimmer.dart';
import '../../core/widgets/skelton.dart';
import 'cubit/new_or_update_transaction_cubit.dart';

part 'widgets/_loading.dart';

class NewOrUpdateTransactionProvider extends StatelessWidget {
  final String? _id;

  const NewOrUpdateTransactionProvider({super.key, String? id}) : _id = id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewOrUpdateTransactionCubit>(param1: _id),
      child: const _NewOrUpdateTransactionPage(),
    );
  }
}

class _NewOrUpdateTransactionPage extends StatefulWidget {
  const _NewOrUpdateTransactionPage();

  @override
  State<_NewOrUpdateTransactionPage> createState() =>
      _NewOrUpdateTransactionPageState();
}

class _NewOrUpdateTransactionPageState
    extends State<_NewOrUpdateTransactionPage> {
  final _amountController = TextEditingController();
  final _purposeController = TextEditingController();

  @override
  void initState() {
    context.read<NewOrUpdateTransactionCubit>().getValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Transaction')),
      body: SafeArea(
        top: false,
        minimum: kScaffoldHPadding,
        child: BlocConsumer<NewOrUpdateTransactionCubit,
            NewOrUpdateTransactionState>(
          // Only when the [NewOrUpdateTransactionState] changes to [Loaded] for the first time.
          listenWhen: (previous, current) =>
              previous is! Loaded && current is Loaded,
          listener: (context, state) {
            _purposeController.text = (state as Loaded).purpose ?? '';
            _amountController.text = state.amount.toString();
          },
          // Never rebuild if the previous [NewOrUpdateTransactionState] was [Loaded].
          buildWhen: (previous, current) => previous is! Loaded,
          builder: (context, state) {
            if (state is Loading) {
              return const _LoadingWidget();
            }

            if (state is Error) {
              return const CustomErrorWidget();
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  context.read<NewOrUpdateTransactionCubit>().id == null
                      ? 'New Transaction'
                      : 'Update Transaction',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                kHeight30,

                // Purpose
                TextFormField(
                  controller: _purposeController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Purpose',
                  ),
                ),

                kHeight10,

                // Amount
                TextFormField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Amount',
                  ),
                ),

                kHeight10,

                // Income / Expense
                BlocSelector<NewOrUpdateTransactionCubit,
                    NewOrUpdateTransactionState, CategoryType?>(
                  selector: (state) => (state as Loaded).type,
                  builder: (context, type) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: CategoryType.income,
                              groupValue: type,
                              onChanged: (newValue) => context
                                  .read<NewOrUpdateTransactionCubit>()
                                  .valueChanged(type: newValue),
                            ),
                            const Text('Income'),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: CategoryType.expense,
                              groupValue: type,
                              onChanged: (newValue) => context
                                  .read<NewOrUpdateTransactionCubit>()
                                  .valueChanged(type: newValue),
                            ),
                            const Text('Expense'),
                          ],
                        ),
                      ],
                    );
                  },
                ),

                kHeight10,

                // Category
                Padding(
                  padding: kScaffoldHPadding,
                  child: BlocBuilder<NewOrUpdateTransactionCubit,
                      NewOrUpdateTransactionState>(
                    buildWhen: (previous, current) =>
                        ((previous as Loaded).type !=
                                (current as Loaded).type ||
                            previous.category != current.category),
                    builder: (context, state) {
                      return DropdownButton<Category>(
                        isExpanded: true,
                        hint: const Text('Select a category'),
                        value: (state as Loaded).category,
                        items: state.categories
                            .map((category) => DropdownMenuItem<Category>(
                                  value: category,
                                  child: Text(category.name),
                                ))
                            .toList(),
                        onChanged: (value) => context
                            .read<NewOrUpdateTransactionCubit>()
                            .valueChanged(category: value),
                      );
                    },
                  ),
                ),

                kHeight10,

                // Date
                TextButton.icon(
                  onPressed: () => showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate:
                              DateTime.now().subtract(const Duration(days: 30)),
                          lastDate: DateTime.now())
                      .then((value) {
                    if (value != null) {
                      context
                          .read<NewOrUpdateTransactionCubit>()
                          .valueChanged(date: value);
                    }
                  }),
                  icon: const Icon(Icons.calendar_today),
                  label: BlocSelector<NewOrUpdateTransactionCubit,
                      NewOrUpdateTransactionState, DateTime?>(
                    selector: (state) => (state as Loaded).date,
                    builder: (context, date) => Text(
                      date == null
                          ? 'Select Date'
                          : DateFormat.yMMMd().format(date),
                    ),
                  ),
                ),
                kHeight50,

                // Submit
                BlocListener<NewOrUpdateTransactionCubit,
                    NewOrUpdateTransactionState>(
                  listener: (context, state) =>
                      (state as Loaded).status.snackBarNotify(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: Navigator.of(context).pop,
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: _saveTransaction,
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _purposeController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _saveTransaction() => context.read<NewOrUpdateTransactionCubit>().save(
        purpose: _purposeController.text,
        amount: double.tryParse(_amountController.text),
      );
}
