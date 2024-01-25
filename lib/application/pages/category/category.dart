import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_manager/application/core/styles.dart';
import 'package:money_manager/application/pages/core/widgets/error.dart';

import '../../../core/di/injectable.dart';
import 'cubit/category_cubit.dart';
import 'widgets/categories_loading.dart';
import 'widgets/expense_category.dart';
import 'widgets/income_category.dart';

class CategoryPageProvider extends StatelessWidget {
  const CategoryPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoryCubit>(),
      child: const CategoryPage(),
    );
  }
}

class CategoryPage extends StatelessWidget {
  static const path = '/category';

  const CategoryPage({super.key});

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
            labelColor: Colors.black,
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
                return const CategoriesLoadingWidget();
              }

              if (state is Error) {
                return const Center(child: CustomErrorWidget());
              }

              return const TabBarView(
                children: [
                  IncomeList(),
                  ExpenseList(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
