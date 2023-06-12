import 'package:mobx/mobx.dart';
import 'package:proj_pi/user_model.dart';

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
  void addRegisteredUser(UserModel user) {
  registeredUsers.add(user);
}

  @action
Future<void> login() async {
  // Simulando um processo de login assíncrono
 // await Future.delayed(Duration(seconds: 2));

  // Verificar se o email e a senha correspondem a um usuário cadastrado
  for (var user in registeredUsers) {
    if (user.email == email && user.password == password) {
      isRegistered = true;
      loggedInUser = user;
      return;
    }
  }

  // Se nenhum usuário correspondente for encontrado
  isRegistered = false;
}
}