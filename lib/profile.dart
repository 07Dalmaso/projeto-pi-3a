
import 'package:flutter/material.dart';
import 'package:proj_pi/user.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User user = User(
    email: 'example@gmail.com',
    password: 'password',
    name: 'Sabrina',
    cpf: '123.456.789-00',
  );

 @override
 Widget build(BuildContext context) {

  List<Color> colors = [
      Color.fromARGB(255, 69, 72, 73)!,
      Color.fromARGB(255, 97, 104, 107)!,
      Color.fromARGB(255, 154, 165, 171)!,
      Color.fromARGB(255, 246, 247, 248)!,
    ];
   return Scaffold(
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
          SliverFillRemaining(
            child: Padding(
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
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Icon(Icons.person),
                              backgroundColor: Color.fromARGB(255, 78, 74, 84),
                            ),
                            title: Text('Nome: ${user.name}'),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              child: Icon(Icons.email),
                              backgroundColor: Color.fromARGB(255, 78, 74, 84),
                            ),
                            title: Text('Email: ${user.email}'),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              child: Icon(Icons.perm_identity),
                              backgroundColor: Color.fromARGB(255, 78, 74, 84),
                            ),
                            title: Text('CPF: ${user.cpf}'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}