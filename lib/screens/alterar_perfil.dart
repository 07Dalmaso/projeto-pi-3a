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
  late final UserModel? user;
  final UserService userService = UserService();

  String _errorEdit = '';

  Future<void> _submitForm(BuildContext context) async {
    if (!_form.currentState!.validate()) {
      return;
    }

    setState(() => _errorEdit = '');

    try {
      UserStore userStore = Provider.of<UserStore>(context, listen: false);
      userStore.setName(_nameController.text);
      userStore.setCPF(_cpfController.text);
      userStore.setEmail(_emailController.text);

      UserService userService = UserService();

      await userService.updateUser(
        firebaseUserId: loggedUserId,
        name: userStore.name,
        cpf: userStore.cpf,
        email: userStore.email,
      );

      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/profile');

      // ignore: use_build_context_synchronously
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
    } catch (e) {
      setState(() => _errorEdit = e.toString());
    }
  }

  Future<UserModel?> _getUserData() async {
    final UserModel? user = await userService.getUser(loggedUserId);
    return user;
  }

  @override
  void initState() {
    super.initState();
    loggedUserId = _auth.currentUser!.uid;
  }

  final colors = [
    Color.fromRGBO(69, 72, 73, 1),
    Color.fromARGB(255, 97, 104, 107),
    Color.fromARGB(255, 154, 165, 171),
    Color.fromARGB(255, 246, 247, 248),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel?>(
        future: _getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text('Error: ${snapshot.error}')),
            );
          } else {
            user = snapshot.data;
            return Scaffold(
                appBar: null,
                body: CustomScrollView(
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
                    SliverFillRemaining(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16),

                            // -- Form Fields
                            Form(
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
                                      controller: _emailController),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'CPF',
                                      prefixIcon: Icon(Icons.perm_identity),
                                    ),
                                    controller: _cpfController,
                                  ),
                                  const SizedBox(height: 20),

                                  // -- Form Submit Button
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        _submitForm(context);
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
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ));
          }
        });
  }
}
