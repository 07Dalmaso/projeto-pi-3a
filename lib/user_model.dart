class UserModel {
  String email;
  String password;
  String? name;
  String? cpf;
  String? key; // Adicionando o atributo key

  UserModel({
    required this.email,
    required this.password,
    this.name,
    this.cpf,
    this.key, // Adicionando o parâmetro key no construtor
  });
}
