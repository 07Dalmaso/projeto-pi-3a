
import 'package:flutter/material.dart';
import 'package:proj_pi/user.dart';
import 'package:proj_pi/cadastro.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String name = '';
  String cpf = '';

  void fazerLogin() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Verifica se o email e senha informados correspondem a um usuário cadastrado
      bool isLoginValid = UserList.checkLogin(email, password);

      if (isLoginValid) {
        Navigator.pushNamed(
          context,
          '/main',
          arguments:
              User(email: email, password: password, name: name, cpf: cpf),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login inválido'),
            content: Text('Email ou senha incorretos.'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  void irParaCadastro() {
    Navigator.pushNamed(context, '/cadastro');
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Color.fromARGB(255, 69, 72, 73),
      Color.fromARGB(255, 97, 104, 107),
      Color.fromARGB(255, 154, 165, 171),
      Color.fromARGB(255, 246, 247, 248),
    ];
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: colors,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 190.0),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        email = value!.trim();
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Insira a sua senha';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      password = value!.trim();
                    },
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
              Navigator.pushNamed(context, '/main');
              // Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
            },
                 // onPressed: fazerLogin,
                  child: Text('Entrar'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextButton(
                  onPressed: irParaCadastro,
                  child: Text('Criar Cadastro'),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}