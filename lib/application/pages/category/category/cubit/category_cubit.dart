import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/use_case.dart';
import '../../../../../domain/entities/category.dart';
import '../../../../../domain/use_cases/delete_category.dart';
import '../../../../../domain/use_cases/get_categories.dart';
import '../../../../../domain/use_cases/params/delete_category.dart';

part 'category_state.dart';
part 'category_cubit.freezed.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  final GetCategories _getCategories;
  final DeleteCategory _deleteCategory;

  CategoryCubit(this._getCategories, this._deleteCategory)
      : super(const Loading());

  Future<void> getAllCategories() async {
    final result = await _getCategories.call(noParams);

    emit(
      result.fold(
        ifLeft: (failure) => const Error(),
        ifRight: (categories) => Loaded(
          income: categories
              .where((category) => category.type == CategoryType.income)
              .toList(),
          expense: categories
              .where((category) => category.type == CategoryType.expense)
              .toList(),
        ),
      ),
    );
  }

  Future<void> delete(BuildContext context, int id) async {
    final result = await _deleteCategory.call(DeleteCategoryParams(id: id));

    result.fold(
      ifLeft: (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed deleting category'),
            backgroundColor: Colors.red,
          ),
        );
      },
      ifRight: (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Successfully deleted category'),
            backgroundColor: Colors.green,
          ),
        );
        getAllCategories();
      },
    );
  }
}
