import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {

  final _auth = FirebaseAuth.instance;

  Future <void> login(String email, String senha) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);

    } on FirebaseAuthException catch (e) {
      if (e.message!.contains("wrong-password")) {
        throw "Senha inválida";
      } else if (e.message!.contains("user-not-found")) {
        throw "Usuário não encontrado";
      }
    }    
  }

  Future <void> logout() async {
    await _auth.signOut();
  }
}