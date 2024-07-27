import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/enums/category_type.dart';

part 'statistics_state.dart';
part 'statistics_cubit.freezed.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit()
      : super(const StatisticsState(category: CategoryType.expense));

  void changeCategory(CategoryType category) {
    emit(StatisticsState(category: category));
  }
}
