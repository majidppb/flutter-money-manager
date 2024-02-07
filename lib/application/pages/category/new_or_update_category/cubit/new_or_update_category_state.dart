part of 'new_or_update_category_cubit.dart';

@freezed
class NewOrUpdateCategoryState with _$NewOrUpdateCategoryState {
  const factory NewOrUpdateCategoryState.loading() = Loading;

  const factory NewOrUpdateCategoryState.error() = Error;

  const factory NewOrUpdateCategoryState.loaded({
    @Default(NewOrUpdateStatus.editing) final NewOrUpdateStatus status,
    final String? name,
    final CategoryType? type,
  }) = Loaded;
}
