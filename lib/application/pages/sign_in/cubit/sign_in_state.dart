part of 'sign_in_cubit.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.error() = Error;

  const factory SignInState.initial() = Initial;

  const factory SignInState.signingIn() = SigningIn;

  const factory SignInState.success() = Success;
}
