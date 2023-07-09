import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proj_pi/services/user_service.dart';
import 'package:proj_pi/store/user_store.dart';
import 'package:provider/provider.dart';
import 'package:proj_pi/models/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final String loggedUserId;
  final UserService userService = UserService();
  Map<String, dynamic>? userData;

  Future<void> _getUserData() async {
    try {
      userData = await userService.getUser(loggedUserId);
      setState(() {});
    } catch (e) {
      print('Error getting user data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    loggedUserId = _auth.currentUser!.uid;
    _getUserData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: userData != null
          ? CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  centerTitle: false,
                  automaticallyImplyLeading: false,
                  expandedHeight: MediaQuery.of(context).size.height * 0.25,
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 69, 72, 73)!,
                          Color.fromARGB(255, 97, 104, 107)!,
                          Color.fromARGB(255, 154, 165, 171)!,
                          Color.fromARGB(255, 246, 247, 248)!,
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pushNamed(context, '/main');
                          },
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Meu Perfil",
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
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: TextField(
                              enabled: false,
                              decoration: const InputDecoration(
                                labelText: 'Nome do Titular',
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                              ),
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Color.fromARGB(255, 69, 72, 73),
                              ),
                              controller: TextEditingController(
                                text: userData!['name'],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: TextField(
                              enabled: false,
                              decoration: const InputDecoration(
                                labelText: 'CPF',
                                prefixIcon: Icon(Icons.badge),
                                border: OutlineInputBorder(),
                              ),
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Color.fromARGB(255, 69, 72, 73),
                              ),
                              controller: TextEditingController(
                                text: userData!['cpf'],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: TextField(
                              enabled: false,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(),
                              ),
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Color.fromARGB(255, 69, 72, 73),
                              ),
                              controller: TextEditingController(
                                text: userData!['email'],
                              ),
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      child: Text('Alterar Perfil'),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/alt_perfil',
                                          arguments: userData!['userId'],
                                        );
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          Colors.green,
                                        ),
                                        fixedSize:
                                            MaterialStateProperty.all<Size>(
                                          Size(
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                          ),
                                        ),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    ElevatedButton(
                                      child: Text('Sair'),
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/login');
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          Colors.red,
                                        ),
                                        fixedSize:
                                            MaterialStateProperty.all<Size>(
                                          Size(
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                          ),
                                        ),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            )
          : Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
    );
  }
}