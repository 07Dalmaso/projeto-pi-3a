// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:proj_pi/login_screen.dart';
import 'package:proj_pi/user.dart';
import 'package:proj_pi/cadastro.dart'; 
import 'package:proj_pi/splash_screen.dart';


/*class _User extends User {
   User minhaInstancia = User();
}*/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.deepPurple,
        //primaryColor: Color.fromARGB(255, 104, 36, 206),
      ),

      initialRoute: '/splash_screen',
      routes: {
        '/main': (context) => const MyHomePage(title: 'Bem vindo(a), Usuário!'),
        '/login': (context) => LoginPage(),
        '/cadastro': (context) => CadastroPage(), 
        '/splash_screen':(context) => SplashScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Implementar ação do botão "Configurações"
              },
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                // Implementar ação das opções do menu
              },
              itemBuilder: (BuildContext context) {
                return {'Meu Perfil', 'Configurações'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
           SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Código para lidar com o clique no botão
            },
            child: Text(
              'Meus Cartões',
              style: TextStyle(fontSize: 20),
              
            ),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(300, 80)), // Largura de 200 e altura de 50
              backgroundColor: MaterialStateProperty.all(
                  Colors.deepPurple), // Cor de fundo azul
            ),
          ),
           SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Código para lidar com o clique no botão
            },
            child: Text(
              'Controle de Gastos',
              style: TextStyle(fontSize: 20),

            ),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(300, 80)), // Largura de 200 e altura de 50
              backgroundColor: MaterialStateProperty.all(
                  Colors.deepPurple), // Cor de fundo azul
            ),
          ),
           SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Código para lidar com o clique no botão
            },
            child: Text(
              'Histórico de Finanças',
              style: TextStyle(fontSize: 20),
              
            ),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(300, 80)), // Largura de 200 e altura de 50
              backgroundColor: MaterialStateProperty.all(
                  Colors.deepPurple), // Cor de fundo azul
            ),
          ),
        ])));
  }
}
