class UserModel {
  final int id;
  final String username;
  final String password;
  final String firstname;
  final String lastname;

  UserModel(
      {required this.id,
      required this.username,
      required this.password,
      required this.firstname,
      required this.lastname});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      firstname: json['firstname'],
      lastname: json['lastname']);
}
