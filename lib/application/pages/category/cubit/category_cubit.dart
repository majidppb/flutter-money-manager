import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:money_manager/core/use_case.dart';
import 'package:money_manager/domain/entities/category.dart';
import 'package:money_manager/domain/use_cases/get_categories.dart';

part 'category_state.dart';
part 'category_cubit.freezed.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  final GetCategories _getCategories;

  CategoryCubit(this._getCategories) : super(const Loading());

  Future<void> getAllCategories() async {
    final result = await _getCategories.call(NoParams());

    emit(
      result.fold(
        ifLeft: (failure) => const Error(),
        ifRight: (categories) => Categories(
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
}
