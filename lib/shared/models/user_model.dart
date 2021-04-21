class UserModel {
  final String name;
  final String photoURL;
  final int score;
  UserModel({
    required this.name,
    required this.photoURL,
    this.score = 0,
  });
}
