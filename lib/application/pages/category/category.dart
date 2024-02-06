import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/styles.dart';
import '../core/widgets/error.dart';
import '../../../core/di/injectable.dart';
import '../core/widgets/shimmer.dart';
import '../core/widgets/skelton.dart';
import 'cubit/category_cubit.dart';

part 'widgets/_loading.dart';
part 'widgets/_expense_list.dart';
part 'widgets/_income_list.dart';

class CategoryPageProvider extends StatelessWidget {
  const CategoryPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoryCubit>(),
      child: const _CategoryPage(),
    );
  }
}

class _CategoryPage extends StatelessWidget {
  const _CategoryPage();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<CategoryCubit>().getAllCategories(),
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Income'),
              Tab(text: 'Expense'),
            ],
          ),
        ),
        body: SafeArea(
          top: false,
          minimum: kScaffoldHPadding,
          child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state is Loading) {
                return const _LoadingWidget();
              }

              if (state is Error) {
                return const CustomErrorWidget();
              }

              return const TabBarView(
                children: [
                  _IncomeList(),
                  _ExpenseList(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
