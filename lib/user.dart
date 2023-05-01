import 'main.dart';

class User {
  String email;
  String password;
  String name; 
  String cpf;

  User({required this.email, required this.password, required this.name, required this.cpf});
}

class UserList {
  static List<User> users = [];

  static void addUser(User user) {
    users.add(user);
  }

  static bool checkLogin(String email, String password) {
    for (var user in users) {
      if (user.email == email && user.password == password) {
        return true;
      }
    }
    return false;
  }
}


