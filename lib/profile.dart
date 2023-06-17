import 'package:flutter/material.dart';
import 'package:proj_pi/user_store.dart';
import 'package:provider/provider.dart';
import 'package:proj_pi/user_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<UserStore>(
          create: (_) => UserStore(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProfilePage(),
      ),
    ),
  );
}

class ProfilePage extends StatelessWidget {
 final _formKey = GlobalKey<FormState>();
  final nameController = '';
  final emailController = '';
  final cpfController = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserStore>(
        builder: (context, userStore, _) {
          UserModel? loggedInUser = userStore.loggedInUser;
           userStore.mostrarDados(userStore.registeredUsers);

          List<Color> colors = [
            Color.fromARGB(255, 69, 72, 73)!,
            Color.fromARGB(255, 97, 104, 107)!,
            Color.fromARGB(255, 154, 165, 171)!,
            Color.fromARGB(255, 246, 247, 248)!,
          ];

    userStore.setEmail(emailController);
    userStore.setPassword(nameController);
    userStore.setEmail(cpfController);

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
  delegate: SliverChildListDelegate(
    [
    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/image.jpg'),
                              backgroundColor: Color.fromARGB(255, 78, 74, 84),
                            ),
                          ),
                          SizedBox(height: 16),
                         Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Nome do Titular',
                                hintText: nameController,
                                border: OutlineInputBorder(),
                              ),
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromARGB(255, 69, 72, 73),
                              ),
                              //controller: nameController,
                              enabled: false,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: emailController,
                                border: OutlineInputBorder(),
                              ),
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromARGB(255, 69, 72, 73),
                              ),
                              //controller: emailController,
                              enabled: false,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'CPF',
                                hintText: cpfController,
                                border: OutlineInputBorder(),
                              ),
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromARGB(255, 69, 72, 73),
                              ),
                              //controller: cpfController,
                              enabled: false,
                            ),
                          ),
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
                                    Navigator.pushNamed(context, '/alt_perfil');
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.green,
                                    ),
                                    fixedSize: MaterialStateProperty.all<Size>(
                                      Size(
                                        MediaQuery.of(context).size.width * 0.4,
                                        MediaQuery.of(context).size.height * 0.07,
                                      ),
                                    ),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
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
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.red,
                                    ),
                                    fixedSize: MaterialStateProperty.all<Size>(
                                      Size(
                                        MediaQuery.of(context).size.width * 0.4,
                                        MediaQuery.of(context).size.height * 0.07,
                                      ),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
    )]);
        }
      ));
     }
    }