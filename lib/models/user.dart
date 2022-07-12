class User {
  String firstName;
  String lastName;
  String profilePhotoUrl;

  User(
      {required this.firstName, this.lastName = "", this.profilePhotoUrl = ""});
}
