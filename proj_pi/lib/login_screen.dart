import 'package:flutter/material.dart';
import 'package:proj_pi/user.dart';
import 'package:proj_pi/cadastro.dart'; 
//import 'package:velocity_x/velocity_x.dart';
//import 'main.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String name= '';
  String cpf='';
  
  void fazerLogin() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Verifica se o email e senha informados correspondem a um usuário cadastrado
      bool isLoginValid = UserList.checkLogin(email, password);

      if (isLoginValid) {
        Navigator.pushNamed(
        context,
        '/main',
          arguments: User(email: email, password: password, name: name,cpf: cpf ),
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
  return Scaffold(
    appBar: AppBar(
      //title: Text('Entrar'),
    ),
    body: Container(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
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
                  fazerLogin();
                },
                child: Text('Entrar'),
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  irParaCadastro();
                },
                child: Text('Criar Cadastro'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
}