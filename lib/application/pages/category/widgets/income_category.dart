import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/category_cubit.dart';

class IncomeList extends StatelessWidget {
  const IncomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
        buildWhen: (previous, current) =>
            (previous as Categories).income != (current as Categories).income,
        builder: (context, state) {
          return ListView.separated(
            itemBuilder: (context, index) {
              final item = state.income[index];
              return ListTile(
                title: Text(item.name),
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.delete)),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: (state as Categories).income.length,
          );
        });
  }
}
