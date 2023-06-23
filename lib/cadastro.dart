import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';
import 'package:proj_pi/store/user_store.dart';
import 'package:proj_pi/models/user_model.dart';

class CadastroPage extends StatefulWidget {
  @override
  CadastroPageState createState() => CadastroPageState();
}

class CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    UserStore userStore = Provider.of<UserStore>(context);
    //final List<UserModel> registeredUsers = userStore.registeredUsers;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    List<Color> colors = [
      Color.fromARGB(255, 69, 72, 73),
      Color.fromARGB(255, 97, 104, 107),
      Color.fromARGB(255, 154, 165, 171),
      Color.fromARGB(255, 246, 247, 248),
    ];

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
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SizedBox(height: 16.0),
                            TextFormField(
                              initialValue: userStore.name,
                              onChanged: userStore.setName,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Nome é obrigatório';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Nome',
                                hintText: 'Ex: Sabrina',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              initialValue: userStore.cpf,
                              onChanged: userStore.setCPF,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'CPF é obrigatório';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'CPF',
                                hintText: 'Ex: 123.456.789-00',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              initialValue: userStore.email,
                              onChanged: userStore.setEmail,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email é obrigatório';
                                }
                                if (!EmailValidator.validate(value)) {
                                  return 'Email inválido';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'Ex: exemplo@gmail.com',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              initialValue: userStore.password,
                              onChanged: userStore.setPassword,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Senha é obrigatória';
                                }
                                if (value.length < 6) {
                                  return 'Senha inválida. Requer mínimo de 6 dígitos';
                                }
                                return null;
                              },
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
                                if (_formKey.currentState!.validate()) {
                                  if (userStore.isFormValid) {
                                    userStore.saveUser();
                                    _formKey.currentState!.reset();
                                    Navigator.pushReplacementNamed(
                                        context, '/main');
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
