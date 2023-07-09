import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:proj_pi/models/user_model.dart';

class UserService {
  final DatabaseReference ref = FirebaseDatabase.instance.refFromURL(
      "https://projetoflutterteste-6cd90-default-rtdb.firebaseio.com/");
  late final DatabaseReference _userRef = ref.child('users');

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
      'nome': name,
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
      // Trate o erro de redefinição de password aqui
      print('Erro ao redefinir a password: $e');
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

  Future<Map<String, dynamic>?> getUser(String firebaseUserId) async {
    try {
      final DatabaseEvent snapshot = await _userRef
          .orderByChild('firebaseUserId')
          .equalTo(firebaseUserId)
          .limitToFirst(1)
          .once();
      final userMap = snapshot.snapshot.value as Map<dynamic, dynamic>?;

      if (userMap != null) {
        final userData = userMap.values.first;

         return {
        'email': userData['email'],
        'userId': userData['firebaseUserId'],
        'password': userData['password'],
        'name': userData['nome'],
        'cpf': userData['cpf'],
      };
      }
    } catch (e) {
      // Handle error here
      print('Error getting user data: $e');
      return null;
  }
}

  Future<void> updateUser({
    required String firebaseUserId,
    String? name,
    String? cpf,
    String? email,
  }) async {
    try {
      final DatabaseEvent snapshot = await _userRef
          .orderByChild('firebaseUserId')
          .equalTo(firebaseUserId)
          .limitToFirst(1)
          .once();
      final userMap = snapshot.snapshot.value as Map<dynamic, dynamic>?;

      if (userMap != null) {
        final userId = userMap.keys.first;

        final updatedUserData = <String, dynamic>{};

        if (name != null) {
          updatedUserData['nome'] = name;
          await _auth.currentUser?.updateDisplayName(name);
        }

        if (cpf != null) {
          updatedUserData['cpf'] = cpf;
        }

        if (email != null) {
          updatedUserData['email'] = email;
          await _auth.currentUser?.updateEmail(email);
        }

        if (updatedUserData.isNotEmpty) {
          await _userRef.child(userId).update(updatedUserData);
        }
      }
    } catch (e) {
      // Trate o erro de atualização do usuário aqui
      print('Erro ao atualizar o usuário: $e');
    }
  }
}
