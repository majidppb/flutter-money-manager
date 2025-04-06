import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/category.dart';
import '../../../core/styles.dart';
import '../../core/widgets/error.dart';
import '../../../../core/di/injectable.dart';
import '../../core/widgets/shimmer.dart';
import '../../core/widgets/skelton.dart';
import '../new_or_update_category/new_or_update_category.dart';
import 'cubit/category_cubit.dart';

part 'widgets/_loading.dart';
part 'widgets/_category_list.dart';

class CategoryProvider extends StatelessWidget {
  static const icon =
      Hero(tag: 'category', child: Icon(Icons.category_rounded));

  const CategoryProvider({super.key});

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
          leading: CategoryProvider.icon,
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

              return TabBarView(
                children: [
                  _CategoryList(
                    categories: (state as Loaded).income,
                    onUpdate: _onNewOrUpdate,
                  ),
                  _CategoryList(
                    categories: state.expense,
                    onUpdate: _onNewOrUpdate,
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _onNewOrUpdate(context),
          tooltip: 'New Category',
          child: const Icon(Icons.add_rounded),
        ),
      ),
    );
  }

  /// Go to the NewOrUpdateCategory Page.
  /// Refresh the categories if there are any changes.
  void _onNewOrUpdate(BuildContext context, {String? id}) {
    Navigator.of(context)
        .push<bool>(MaterialPageRoute(
            builder: (context) => NewOrUpdateCategoryProvider(id: id)))
        .then((isRefreshNeeded) {
      if (isRefreshNeeded == true && context.mounted) {
        context.read<CategoryCubit>().getAllCategories();
      }
    });
  }
}
