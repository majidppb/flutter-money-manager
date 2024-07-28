part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default('') final String query,
    @Default([]) final List<Transaction> result,
  }) = _SearchState;
}
