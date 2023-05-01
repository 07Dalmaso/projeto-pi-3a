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
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('Meu Perfil'),
    ),
    body: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_picture.jpg'),
              backgroundColor: Color.fromARGB(255, 78, 74, 84), // Cor de fundo azul
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
          Container(
            margin: EdgeInsets.only(top: 16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/main');
              },
              icon: Icon(Icons.arrow_back),
              label: Text('Voltar'),
            ),
          ),
        ],
      ),
    ),
  );
}
}