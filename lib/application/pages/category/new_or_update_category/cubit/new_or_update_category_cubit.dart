import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/enums/category_type.dart';
import '../../../../../domain/use_cases/get_category.dart';
import '../../../../../domain/use_cases/new_or_update_category.dart';
import '../../../../../domain/use_cases/params/get_category.dart';
import '../../../../../domain/use_cases/params/new_or_update_category.dart';
import '../../../../core/colors.dart';
import '../../../core/utils/new_or_update_status.dart';

part 'new_or_update_category_state.dart';
part 'new_or_update_category_cubit.freezed.dart';

@injectable
class NewOrUpdateCategoryCubit extends Cubit<NewOrUpdateCategoryState> {
  final String? id;
  final GetCategory _getCategory;
  final NewOrUpdateCategory _newOrUpdateCategory;

  NewOrUpdateCategoryCubit(
      this._getCategory, this._newOrUpdateCategory, @factoryParam this.id)
      : super(const Loading());

  Future<void> getValues() async {
    // If [id] is null: New category
    if (id == null) {
      emit(const Loaded());
    } else {
      final result = await _getCategory.call(GetCategoryParams(id: id!));

      emit(
        result.fold(
          ifLeft: (failure) => const Error(),
          ifRight: (category) => Loaded(
            name: category.name,
            type: category.type,
            color: category.color,
          ),
        ),
      );
    }
  }

  void valueChanged({CategoryType? type, Color? color}) => emit(
        (state as Loaded).copyWith(
          type: type ?? (state as Loaded).type,
          color: color ?? (state as Loaded).color,
        ),
      );

  Future<void> save({required String? name}) async {
    if (name != null && (state as Loaded).type != null) {
      emit(
        (state as Loaded).copyWith(status: NewOrUpdateStatus.saving),
      );

      final result = await _newOrUpdateCategory.call(
        NewOrUpdateCategoryParams(
          id: id,
          name: name,
          type: (state as Loaded).type!,
          color: (state as Loaded).color,
        ),
      );

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
