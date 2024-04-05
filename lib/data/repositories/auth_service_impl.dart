import 'package:dart_either/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/failure/failure.dart';
import '../../domain/entities/app_user.dart';
import '../../domain/repositories/auth_service.dart';
import '../data_sources/mapper/app_user.dart';

@Singleton(as: AuthService)
final class AuthServiceImpl with AppUserMapper implements AuthService {
  /// https://firebase.google.com/docs/auth/flutter/federated-auth#google
  @override
  Future<Either<Failure, UserCredential>> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return Right(
          await FirebaseAuth.instance.signInWithCredential(credential));
    } on Exception {
      return const Left(Failure.serverFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return isSignedIn
          ? const Left(Failure.serverFailure())
          : const Right(null);
    } on Exception {
      return const Left(Failure.serverFailure());
    }
  }

  @override
  bool get isSignedIn => FirebaseAuth.instance.currentUser != null;

  @override
  Future<Either<Failure, AppUser>> getUser() async {
    try {
      return Right(fireBaseUserToAppUser(FirebaseAuth.instance.currentUser!));
    } on Exception {
      return const Left(Failure.serverFailure());
    }
  }

  @override
  String? get userId => FirebaseAuth.instance.currentUser?.uid;
}
