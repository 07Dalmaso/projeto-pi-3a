import 'package:mobx/mobx.dart';
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
  bool isRegistered = false;

  @observable
  String errorMessage = '';

  @observable
  UserModel? loggedInUser;

  @action
  void setEmail(String value) {
    email = value;
    if (loggedInUser != null) {
      loggedInUser!.email = value;
    }
  }

  @action
  void setPassword(String value) {
    password = value;
    if (loggedInUser != null) {
      loggedInUser!.password = value;
    }
  }

  @action
  void setName(String value) {
    name = value;
    if (loggedInUser != null) {
      loggedInUser!.name = value;
    }
  }

  @action
  void setCPF(String value) {
    cpf = value;
    if (loggedInUser != null) {
      loggedInUser!.cpf = value;
    }
  }

 @action
void mostrarDados(List<UserModel> user) {
  registeredUsers = user;
}

  @action
  void addRegisteredUser(UserModel user) {
  registeredUsers.add(user);
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
      // Usuário encontrado e senha válida
      loggedInUser = foundUser;
      isRegistered = true;
      return foundUser;
    } else {
      // Email ou senha inválidos
      isRegistered = false;
      return null;
    }
  }
}