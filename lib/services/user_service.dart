import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class UserService {
  final DatabaseReference _rootRef = FirebaseDatabase.instance.refFromURL(
      "https://projetoflutterteste-6cd90-default-rtdb.firebaseio.com/");
  late final DatabaseReference _userRef = _rootRef.child('users');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> saveUser({
    required String name,
    required String cpf,
    required String email,
    required String password,
  }) async {
    // Criar um novo nó para o usuário
    final newUserRef = _userRef.push();
    final String? userId = newUserRef.key;

    // Definir os dados do usuário
    await newUserRef.set({
      'name': name,
      'cpf': cpf,
      'email': email,
      'password': password,
    });

    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Atualizar o perfil do usuário com o nome
      await _auth.currentUser?.updateDisplayName(name);

      // Associar um ID do usuário gerado no Realtime Database com o ID do usuário no Firebase Authentication
      await _userRef
          .child(userId!)
          .update({'firebaseUserId': _auth.currentUser?.uid});
    } catch (e) {
      // Trate o erro de criação do usuário no Firebase Authentication aqui
      print('Erro ao salvar o usuário: $e');
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      // Trate o erro de autenticação aqui
      rethrow;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      // Trate o erro de redefinição de senha aqui
      print('Erro ao redefinir a senha: $e');
    }
  }

  Future<bool> isEmailRegistered(String email) async {
    try {
      final methods = await _auth.fetchSignInMethodsForEmail(email);
      return methods.isNotEmpty;
    } catch (e) {
      // Trate o erro de verificação de email aqui
      print('Erro ao verificar email: $e');
      return false;
    }
  }
}
