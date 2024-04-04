import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case.dart';
import '../../../../../domain/entities/category.dart';
import '../../../../../domain/enums/category_type.dart';
import '../../../../../domain/use_cases/new_or_update_transaction.dart';
import '../../../../../domain/use_cases/get_categories.dart';
import '../../../../../domain/use_cases/get_transaction.dart';
import '../../../../../domain/use_cases/params/new_or_update_transaction.dart';
import '../../../../../domain/use_cases/params/get_transaction.dart';
import '../../../core/new_or_update_status.dart';

part 'new_or_update_transaction_state.dart';
part 'new_or_update_transaction_cubit.freezed.dart';

@injectable
class NewOrUpdateTransactionCubit extends Cubit<NewOrUpdateTransactionState> {
  final String? id;
  final GetCategories _getCategories;
  final NewOrUpdateTransaction _addTransaction;
  final GetTransaction _getTransaction;

  NewOrUpdateTransactionCubit(this._getCategories, this._addTransaction,
      this._getTransaction, @factoryParam this.id)
      : super(const Loading());

  Future<void> getValues() async {
    // If [_id] is null: New transaction
    if (id == null) {
      emit(const Loaded());
    } else {
      final result = await _getTransaction.call(GetTransactionParams(id: id!));

      result.fold(
        ifLeft: (failure) {
          emit(const Error());
        },
        ifRight: (transaction) async {
          emit(Loaded(
            purpose: transaction.purpose,
            amount: transaction.amount,
            date: transaction.date,
          ));
          await valueChanged(type: transaction.category.type);
          await valueChanged(category: transaction.category);
        },
      );
    }
  }

  Future<void> valueChanged({
    DateTime? date,
    CategoryType? type,
    Category? category,
  }) async {
    // If the type of transaction is changed, load the curresponding categories.
    if (type != null) {
      final result = await _getCategories.call(noParams);

      final categories = result.fold(
        ifLeft: (failure) => <Category>[],
        ifRight: (categories) =>
            categories.where((category) => category.type == type).toList(),
      );

      emit(
        (state as Loaded).copyWith(
          type: type,
          categories: categories,
          category: null,
        ),
      );
    }

    emit(
      (state as Loaded).copyWith(
        date: date ?? (state as Loaded).date,
        category: category ?? (state as Loaded).category,
      ),
    );
  }

  Future<void> save({
    required String? purpose,
    required double? amount,
  }) async {
    if (purpose != null &&
        purpose.isNotEmpty &&
        amount != null &&
        (state as Loaded).date != null &&
        (state as Loaded).type != null &&
        (state as Loaded).category != null) {
      emit(
        (state as Loaded).copyWith(status: NewOrUpdateStatus.saving),
      );

      final result = await _addTransaction.call(NewOrUpdateTransactionParams(
        id: id,
        purpose: purpose,
        amount: amount,
        date: (state as Loaded).date!,
        category: (state as Loaded).category!,
      ));

      emit(
        result.fold(
          ifLeft: (failure) => (state as Loaded)
              .copyWith(status: NewOrUpdateStatus.savingFailed),
          ifRight: (success) =>
              (state as Loaded).copyWith(status: NewOrUpdateStatus.saved),
        ),
      );
    } else {
      emit(
        (state as Loaded).copyWith(status: NewOrUpdateStatus.invalid),
      );
    }
  }
}
