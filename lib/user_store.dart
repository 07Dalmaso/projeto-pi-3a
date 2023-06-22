import 'package:mobx/mobx.dart';
import 'package:proj_pi/user_model.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  // Remova a linha final _service = FirebaseService();
  
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
  Future<bool> login(String email, String senha) async {
    try {
      // await _service.login(email, senha);
      this.email = email;
      errorMessage = "";
      return true;
    } catch (e) {
      errorMessage = e.toString();
      this.email = "";
      return false;
    }
  }

  @action
  Future<void> logout() async {
    // await _service.logout();
    email = "";
  }
}