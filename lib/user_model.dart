class UserModel {
  String email;
  String password;
  String ?name;
  String ?cpf;

  UserModel({
   required this.email,
    required this.password,
    this.name,
    this.cpf,
  });
}