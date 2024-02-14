import 'package:dart_either/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../core/failure/failure.dart';
import '../entities/app_user.dart';

abstract class AuthService {
  bool get isSignedIn;
  Future<Either<Failure, AppUser>> getUser();
  Future<Either<Failure, UserCredential>> signInWithGoogle();
  Future<Either<Failure, void>> signOut();
}
