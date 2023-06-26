class UserModel {
  String email;
  String password;
  String userId;
  String? name;
  String? cpf;

  UserModel({
    required this.email,
    required this.password,
    required this.userId,
    this.name,
    this.cpf,
  });
}
