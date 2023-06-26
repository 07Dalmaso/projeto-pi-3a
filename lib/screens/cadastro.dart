import 'package:flutter/material.dart';
import 'package:proj_pi/services/user_service.dart';
import 'package:provider/provider.dart';
import 'package:proj_pi/store/user_store.dart';

class CadastroPage extends StatefulWidget {
  @override
  CadastroPageState createState() => CadastroPageState();
}

class CadastroPageState extends State<CadastroPage> {
  final _form = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _errorLogin = '';

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "O nome é obrigatório";
    }
    if (value.length < 3) {
      return "O nome deve ter no mínimo 3 caracteres";
    }
    return null;
  }

  String? _validateCpf(String? value) {
    if (value == null || value.isEmpty) {
      return "O CPF é obrigatório";
    }
    if (value.length != 11) {
      return "O CPF deve ter exatamente 11 números";
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "E-mail é obrigatório";
    }
    if (!value.contains('@')) {
      return "E-mail inválido";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Senha é obrigatória";
    }
    if (value.length < 8) {
      return "Sua senha deve ter no mínimo 8 caracters";
    }
    return null;
  }

  Future<void> _submitForm(BuildContext context) async {
    if (!_form.currentState!.validate()) {
      return;
    }

    setState(() => _errorLogin = '');

    try {
      UserStore userStore = Provider.of<UserStore>(context, listen: false);
      userStore.setName(_nameController.text);
      userStore.setCPF(_cpfController.text);
      userStore.setEmail(_emailController.text);
      userStore.setPassword(_passwordController.text);

      UserService userService = UserService();

      // Check if the email is already registered
      bool isEmailRegistered =
          await userService.isEmailRegistered(userStore.email);

      if (isEmailRegistered) {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Erro de cadastro'),
              content: const Text('O email fornecido já está registrado.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
        return;
      }

      await userService.saveUser(
        name: userStore.name,
        cpf: userStore.cpf,
        email: userStore.email,
        password: userStore.password,
      );

      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/main');

      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Cadastro bem-sucedido'),
            content: const Text('Seu cadastro foi realizado com sucesso.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      setState(() => _errorLogin = e.toString());
    }
  }

  final colors = [
    const Color.fromARGB(255, 69, 72, 73),
    const Color.fromARGB(255, 97, 104, 107),
    const Color.fromARGB(255, 154, 165, 171),
    const Color.fromARGB(255, 246, 247, 248),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Consumer<UserStore>(
        builder: (context, userStore, _) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                centerTitle: false,
                automaticallyImplyLeading: false,
                expandedHeight: MediaQuery.of(context).size.height * 0.3,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomRight,
                      colors: colors,
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                      ),
                      const Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Cadastro",
                            style: TextStyle(
                              color: Color.fromARGB(255, 206, 202, 202),
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pinned: true,
              ),
              SliverPadding(
                padding: EdgeInsets.all(16.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Form(
                        key: _form,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SizedBox(height: 16.0),
                            TextFormField(
                              controller: _nameController,
                              onChanged: userStore.setName,
                              keyboardType: TextInputType.text,
                              validator: _validateName,
                              decoration: InputDecoration(
                                labelText: 'Nome',
                                hintText: 'Ex: Sabrina',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              controller: _cpfController,
                              onChanged: userStore.setCPF,
                              validator: _validateCpf,
                              decoration: InputDecoration(
                                labelText: 'CPF',
                                hintText: 'Ex: 123.456.789-00',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              controller: _emailController,
                              onChanged: userStore.setEmail,
                              validator: _validateEmail,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'Ex: exemplo@gmail.com',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              controller: _passwordController,
                              onChanged: userStore.setPassword,
                              validator: _validatePassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Senha',
                                hintText: 'Ex: sua_senha',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 70.0),
                            ElevatedButton(
                              onPressed: () {
                                _submitForm(context);
                                if (_form.currentState!.validate()) {
                                  if (userStore.isFormValid) {
                                    userStore.saveUser();
                                  }
                                }
                              },
                              child: Text('Cadastrar'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                minimumSize: Size(150, 60),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
