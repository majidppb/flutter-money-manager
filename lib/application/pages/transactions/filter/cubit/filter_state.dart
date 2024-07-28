part of 'filter_cubit.dart';

@freezed
class FilterState with _$FilterState {
  const factory FilterState({
    final CategoryType? type,
    final Category? category,
    @Default([]) final List<Category> categories,
    @Default([]) final List<Transaction> transactions,
  }) = _FilterState;
}
