import 'package:flutter/material.dart';
import 'package:proj_pi/user.dart';
import 'package:proj_pi/login_screen.dart';

class CadastroPage extends StatefulWidget {
  @override
  CadastroPageState createState() => CadastroPageState();
}

class CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira um email válido';
    }
  
      String emailPattern =
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$'; // Expressão regular para validar o e-mail

  if (!RegExp(emailPattern).hasMatch(value)) {
    return 'Por favor, insira um email válido';
  }
  return null;
}

   String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira uma senha';
    }
    return null; 
  }
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('Email: $email');
      print('Senha: $password');
    }
  }

  void _showCadastro(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Cadastro realizado'),
      content: Text('Usuário cadastrado com sucesso.'),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
          child: Text('OK'),
        ),
      ],
    ),
  );
}

  void cadastrar() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      User novoUsuario = User(email: email, password: password);
      UserList.addUser(novoUsuario);

      _showCadastro(context); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
        TextFormField(
  onChanged: (value) => setState(() => email = value),
  validator: _validateEmail, 
  onSaved: (value) {
    setState(() {
      email = value!.trim();
    });
  },
  decoration: InputDecoration(
    labelText: 'Email',
   
    suffixIcon: Icon(Icons.email),
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(),
    errorBorder: OutlineInputBorder(),
    errorText: _validateEmail(email), 
  ),
),
              TextFormField(
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, informe sua senha';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    password = value!.trim();
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: cadastrar,
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}