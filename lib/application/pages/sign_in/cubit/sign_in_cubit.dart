import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/use_case.dart';
import '../../../../domain/use_cases/sign_in_with_google.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._signInWithGoogle) : super(const Initial());

  final SignInWithGoogle _signInWithGoogle;

  Future<void> signIn() async {
    emit(const SigningIn());
    final result = await _signInWithGoogle.call(noParams);
    emit(
      result.fold(
        ifLeft: (failure) => const Error(),
        ifRight: (success) => const Success(),
      ),
    );
  }
}
