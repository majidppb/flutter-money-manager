final class AppUser {
  final String uid;
  final String email;
  final String name;
  final String? photo;

  const AppUser(
      {required this.uid,
      required this.email,
      required this.name,
      required this.photo});
}
