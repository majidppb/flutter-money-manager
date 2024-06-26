part of 'settings_cubit.dart';

enum SettingsStatus { initial, loaded, signOutSuccess, signOutError }

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required final AppUser user,
    required final SettingsStatus status,
  }) = _SettingsState;

  factory SettingsState.initial() => const SettingsState(
        user: AppUser(uid: '', email: '', name: '', photo: null),
        status: SettingsStatus.initial,
      );
}
