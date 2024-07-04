import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/use_case.dart';
import '../../../../domain/entities/app_user.dart';
import '../../../../domain/entities/summary.dart';
import '../../../../domain/use_cases/get_summary.dart';
import '../../../../domain/use_cases/get_user.dart';
import '../../../../domain/use_cases/singn_out.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  final SignOut _signOut;
  final GetUser _getUser;
  final GetSummary _getSummary;

  SettingsCubit(this._signOut, this._getUser, this._getSummary)
      : super(SettingsState.initial());

  Future<void> getUser() async {
    final result = await _getUser.call(noParams);

    emit(
      result.fold(
        ifLeft: (failure) => state.copyWith(status: SettingsStatus.loaded),
        ifRight: (success) => state.copyWith(
          status: SettingsStatus.loaded,
          user: success,
        ),
      ),
    );
  }

  Future<void> getSummary() async {
    final result = await _getSummary.call(noParams);

    emit(
      result.fold(
        ifLeft: (failure) => state.copyWith(status: SettingsStatus.loaded),
        ifRight: (success) => state.copyWith(
          summary: success,
        ),
      ),
    );
  }

  Future<void> signOut() async {
    final result = await _signOut.call(noParams);

    emit(
      result.fold(
        ifLeft: (failure) =>
            state.copyWith(status: SettingsStatus.signOutError),
        ifRight: (success) =>
            state.copyWith(status: SettingsStatus.signOutSuccess),
      ),
    );
  }
}
