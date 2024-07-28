import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case.dart';
import '../../../../../domain/entities/category.dart';
import '../../../../../domain/entities/transaction.dart';
import '../../../../../domain/enums/category_type.dart';
import '../../../../../domain/use_cases/get_categories.dart';

part 'filter_state.dart';
part 'filter_cubit.freezed.dart';

@injectable
class FilterCubit extends Cubit<FilterState> {
  FilterCubit(this._getCategories) : super(const FilterState());

  final GetCategories _getCategories;

  Future<void> valueChanged({CategoryType? type, Category? category}) async {
    if (type != null) {
      final result = await _getCategories.call(noParams);

      final categories = result.fold(
        ifLeft: (failure) => <Category>[],
        ifRight: (categories) =>
            categories.where((category) => category.type == type).toList(),
      );

      emit(state.copyWith(type: type, categories: categories));
    }
    emit(state.copyWith(type: type ?? state.type, category: category));
  }

  void getFilteredValues(List<Transaction> transactions, Category category) {
    emit(
      FilterState(
        transactions:
            transactions.where((e) => e.category == category).toList(),
      ),
    );
  }
}
