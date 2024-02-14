import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/entities/app_user.dart';

mixin AppUserMapper {
  AppUser fireBaseUserToAppUser(User user) {
    return AppUser(
      email: user.email ?? '',
      name: user.displayName ?? '',
      photo: user.photoURL,
    );
  }
}
