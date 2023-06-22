import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:proj_pi/user_model.dart';
import 'package:email_validator/email_validator.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {

  List<UserModel> registeredUsers = [];

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String name = '';

  @observable
  String cpf = '';

   @observable
  String userId = '';

  @observable
  bool isRegistered = false;

   @observable
  String isLoggedin = '';

  @observable
  String errorMessage = '';

   @action
  void setLogin(String value) {
    isLoggedin = value;
  }

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setName(String value) {
    name = value;
  }

  @action
  void setCPF(String value) {
    cpf = value;
  }

  @computed
  bool get isFormValid =>
      name.isNotEmpty &&
      cpf.isNotEmpty &&
      email.isNotEmpty &&
      password.isNotEmpty;

 @action
void mostrarDados() {
  print('Usuários Salvos:');
    for (var user in registeredUsers) {
    print('Nome do Usuário: ${user.name}');
    print('CPF do Usuário: ${user.cpf}');
    print('Email do Usuário: ${user.email}');
    print('Senha do Usuário: ${user.password}');
    print('id do Usuário: ${user.userId}');
    }
}

  @action
  void addRegisteredUser(UserModel user) {
  registeredUsers.add(user);
  user.userId = UniqueKey().toString();
  //setLogin(userId);
}
 @action
  UserModel? getUserById(String userId) {
    return registeredUsers.firstWhere((user) => user.userId == userId);
  }
  @action
  Future<UserModel?> login() async {
  // Verificar se o email é válido
  if (!EmailValidator.validate(email)) {
      isRegistered = false;
      return null;
    }

    // Encontrar o usuário correspondente ao email
    UserModel? foundUser;

    for (var user in registeredUsers) {
      if (user.email == email) {
        foundUser = user;
        break;
      }
    }

    if (foundUser != null && foundUser.password == password) {
      isRegistered = true;
      setLogin(foundUser.userId);
      return foundUser;
    } else {
      isRegistered = false;
      return null;
    }
  }
  @action
  void saveUser() {
    // Aqui você pode implementar a lógica para salvar o cartão
    UserModel newUser = UserModel(
      userId: userId,
      name : name,
      password: password,
      email: email,
      cpf: cpf,
    );
    addRegisteredUser(newUser);
    mostrarDados();
    isLoggedin = newUser.userId;
 }

 @action
void updateUserProfile(UserModel newUser) {
  UserModel? existingUser = getUserById(newUser.userId);

  if (existingUser != null) {
    existingUser.name = newUser.name;
    existingUser.cpf = newUser.cpf;
    existingUser.email = newUser.email;
  }
}
}