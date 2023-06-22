import 'package:flutter/material.dart';
import 'package:proj_pi/user_model.dart';
import 'package:proj_pi/user_store.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String userId= '';

  void irParaCadastro() {
    Navigator.pushNamed(context, '/cadastro');
  }

 void fazerLogin() {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();

    UserStore userStore = Provider.of<UserStore>(context, listen: false);

    userStore.setEmail(email);
    userStore.setPassword(password);
    //userStore.setLogin(userId);

    userStore.login().then((_) {
      if (userStore.isRegistered) {
        // Login successful
        print('Login successful'); // Debug print
        Navigator.pushNamed(context, '/main');
      } else {
        // Login failed
        print('Login failed'); // Debug print
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Falha no Login'),
            content: Text('Email ou senha inválidos.'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }
}

  @override
  Widget build(BuildContext context) {
     final userStore = Provider.of<UserStore>(context);

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
                SizedBox(height: 45.0),
                ElevatedButton(
  onPressed: fazerLogin,
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
        color: Colors.green,
        width: 2.0),
      ),
    ),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
  ),
  child: Text('Entrar'),
),
                SizedBox(height: 16.0),
                TextButton(
                  onPressed: irParaCadastro,
                  child: Text('Criar Cadastro'),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                   side: MaterialStateProperty.all<BorderSide>(
      BorderSide(color: Colors.white, width: 2.0),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
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