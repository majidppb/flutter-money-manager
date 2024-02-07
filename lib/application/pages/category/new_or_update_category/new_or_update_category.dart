import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injectable.dart';
import '../../../../domain/entities/category.dart';
import '../../../core/styles.dart';
import '../../core/new_or_update_status.dart';
import '../../core/widgets/error.dart';

import 'cubit/new_or_update_category_cubit.dart';

class NewOrUpdateCategoryProvider extends StatelessWidget {
  final int? _id;

  const NewOrUpdateCategoryProvider({super.key, int? id}) : _id = id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewOrUpdateCategoryCubit>(param1: _id),
      child: const _NewOrUpdateCategoryPage(),
    );
  }
}

class _NewOrUpdateCategoryPage extends StatefulWidget {
  const _NewOrUpdateCategoryPage();

  @override
  State<_NewOrUpdateCategoryPage> createState() =>
      _NewOrUpdateCategoryPageState();
}

class _NewOrUpdateCategoryPageState extends State<_NewOrUpdateCategoryPage> {
  final _nameController = TextEditingController();

  @override
  void initState() {
    context.read<NewOrUpdateCategoryCubit>().getValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Category')),
      body: SafeArea(
        top: false,
        minimum: kScaffoldHPadding,
        child: BlocConsumer<NewOrUpdateCategoryCubit, NewOrUpdateCategoryState>(
          // Only when the [NewOrUpdateCategoryState] changes to [Loaded] for the first time.
          listenWhen: (previous, current) =>
              previous is! Loaded && current is Loaded,
          listener: (context, state) =>
              _nameController.text = (state as Loaded).name ?? '',
          // Never rebuild if the previous [NewOrUpdateCategoryState] was [Loaded].
          buildWhen: (previous, current) => previous is! Loaded,
          builder: (context, state) {
            if (state is Loading) {
              // The loading time is insignificant.
              return const SizedBox();
            }

            if (state is Error) {
              return const CustomErrorWidget();
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  context.read<NewOrUpdateCategoryCubit>().id == null
                      ? 'New Category'
                      : 'Update Category',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                kHeight30,

                // Name
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Name',
                  ),
                ),

                kHeight10,

                // Income / Expense
                BlocSelector<NewOrUpdateCategoryCubit, NewOrUpdateCategoryState,
                    CategoryType?>(
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
                                  .read<NewOrUpdateCategoryCubit>()
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
                                  .read<NewOrUpdateCategoryCubit>()
                                  .valueChanged(type: newValue),
                            ),
                            const Text('Expense'),
                          ],
                        ),
                      ],
                    );
                  },
                ),

                kHeight50,

                // Submit
                BlocListener<NewOrUpdateCategoryCubit,
                    NewOrUpdateCategoryState>(
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
                        onPressed: _saveCategory,
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
    _nameController.dispose();
    super.dispose();
  }

  void _saveCategory() =>
      context.read<NewOrUpdateCategoryCubit>().save(name: _nameController.text);
}
