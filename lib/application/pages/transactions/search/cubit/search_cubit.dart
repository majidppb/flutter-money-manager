import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/transaction.dart';
import '../../../../../domain/use_cases/params/search_transaction.dart';
import '../../../../../domain/use_cases/search_transaction.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchTransaction) : super(const SearchState());

  final SearchTransaction _searchTransaction;

  Future<void> search(String query) async {
    if (query.isEmpty) {
      emit(
        SearchState(
          query: query,
          result: const [],
        ),
      );
      return;
    }

    final result =
        await _searchTransaction.call(SearchTransactionParams(query: query));

    emit(
      SearchState(
        query: query,
        result: result.fold(
          ifLeft: (failure) => const [],
          ifRight: (success) => success,
        ),
      ),
    );
  }
}
