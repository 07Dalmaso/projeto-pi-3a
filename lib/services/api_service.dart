import 'dart:convert';
import 'package:http/http.dart' as http;

import '../user_model.dart';

class ApiService {
  const ApiService();

  Future<List<UserModel>> listar() async {
    List<UserModel> registeredUsers = [];
    final url =
        Uri.https("https://pi-fire-7c5d3-default-rtdb.firebaseio.com", "users.json");
    final response = await http.get(url);
    final data = json.decode(response.body) as Map<String, dynamic>;
    data.forEach((key, value) {
      final user =
          UserModel(email: value['email'], password: value['password']);
      user.key = key;
      registeredUsers.add(user);
    });
    return registeredUsers;
  }

  Future<void> inserir(UserModel user) async {
    final url =
        Uri.https("https://pi-fire-7c5d3-default-rtdb.firebaseio.com", "users.json");
    final response = await http.post(url,
        body: json.encode(
          {'email': user.email, 'password': user.password},
        ),
        headers: {'Content-type': 'application/json'});
    final data = json.decode(response.body) as Map<String, dynamic>;
    user.key = data['name'];
  }

  Future<void> remover(UserModel user) async {   
    final url =
        Uri.parse('https://pi-fire-7c5d3-default-rtdb.firebaseio.com/users/${user.key}.json');
    await http.delete(url);
  }
}
