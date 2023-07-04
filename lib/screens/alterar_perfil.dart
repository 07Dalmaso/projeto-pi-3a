import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proj_pi/models/user_model.dart';
import 'package:proj_pi/services/user_service.dart';
import 'package:proj_pi/store/user_store.dart';
import 'package:provider/provider.dart';

class UpdateProfileScreen extends StatefulWidget {
  final String userId;

  UpdateProfileScreen({required this.userId});

  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<UpdateProfileScreen> {
  final _form = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final String loggedUserId;
  final UserService userService = UserService();

  String? userName;
  String? userId;
  String? email;
  String? cpf;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    pegarUserId();
    loggedUserId = _auth.currentUser!.uid;
  }

  void pegarUserId() async {
    UserService userService = UserService();
    var userData = await userService.getUser(widget.userId);
    String? user_Name;
    String? user_email;
    String? user_Cpf;
    print(userData?.name);
    if (userData != null) {
      user_Name = userData?.name;
      user_email = userData?.email;
      user_Cpf = userData?.cpf;
    }

    setState(() {
      userName = user_Name;
      cpf = user_Cpf;
      email = user_email;
      _nameController.text = user_Name!;
      _cpfController.text = user_Cpf!;
      _emailController.text = user_email!;
    });
  }

  Future<void> _submitForm(BuildContext context) async {
    if (!_form.currentState!.validate()) {
      return;
    }

    UserStore userStore = Provider.of<UserStore>(context, listen: false);

    if (_nameController.text == '') {
      userStore.setName(userName!);
    } else {
      userStore.setName(_nameController.text);
    }
    if (_cpfController.text == '') {
      userStore.setCPF(cpf!);
    } else {
      userStore.setCPF(_cpfController.text);
    }
    if (_emailController.text == '') {
      userStore.setEmail(email!);
    } else {
      userStore.setEmail(_emailController.text);
    }

    UserService userService = UserService();

    await userService.updateUser(
      firebaseUserId: loggedUserId,
      name: userStore.name,
      cpf: userStore.cpf,
      email: userStore.email,
    );

    Navigator.pushReplacementNamed(context, '/profile');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edição bem-sucedida'),
          content:
              const Text('A edição do seu perfil foi realizada com sucesso!'),
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
  }

  final colors = [
    Color.fromRGBO(69, 72, 73, 1),
    Color.fromARGB(255, 97, 104, 107),
    Color.fromARGB(255, 154, 165, 171),
    Color.fromARGB(255, 246, 247, 248),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          CustomScrollView(
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
                          Navigator.pushNamed(context, '/profile');
                        },
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Alterar Perfil",
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
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16),
                          SingleChildScrollView(
                            child: Form(
                              key: _form,
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Nome',
                                      prefixIcon: Icon(Icons.person),
                                    ),
                                    controller: _nameController,
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Email',
                                      prefixIcon: Icon(Icons.email),
                                    ),
                                    controller: _emailController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return null;
                                      } else if (!value.contains('@')) {
                                        return 'E-mail inválido';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'CPF',
                                      prefixIcon: Icon(Icons.perm_identity),
                                    ),
                                    controller: _cpfController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return null;
                                      } else if (value.length != 11) {
                                        return "O CPF deve ter exatamente 11 números";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_nameController.text.isNotEmpty ||
                                            _emailController.text.isNotEmpty ||
                                            _cpfController.text.isNotEmpty) {
                                          setState(() {
                                            _isLoading = true;
                                          });
                                          _submitForm(context);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Preencha pelo menos um campo'),
                                            ),
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        side: BorderSide.none,
                                        shape: const StadiumBorder(),
                                      ),
                                      child: const Text(
                                        'Salvar Perfil',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
          if (_isLoading)
            Container(
              color: Colors.black54,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
