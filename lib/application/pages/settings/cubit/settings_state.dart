part of 'settings_cubit.dart';

enum SettingsStatus { initial, loaded, signOutSuccess, signOutError }

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required final AppUser user,
    required final SettingsStatus status,
    required final Summary summary,
  }) = _SettingsState;

  factory SettingsState.initial() => const SettingsState(
        user: AppUser(uid: '', email: '', name: '', photo: null),
        summary: Summary(total: 0, day: 0, week: 0, month: 0),
        status: SettingsStatus.initial,
      );
}
