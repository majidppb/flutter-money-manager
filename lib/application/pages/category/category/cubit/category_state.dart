part of 'category_cubit.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.loading() = Loading;
  const factory CategoryState.error() = Error;
  const factory CategoryState({
    required List<Category> income,
    required List<Category> expense,
  }) = Loaded;
}
