// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:proj_pi/login_screen.dart';
//import 'package:proj_pi/user.dart';
import 'package:proj_pi/cadastro.dart'; 
import 'package:proj_pi/splash_screen.dart';
import 'package:proj_pi/test.dart';
import 'package:proj_pi/profile.dart';
import 'package:proj_pi/gastos.dart';
import 'dart:ui';


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

    final List<Color> colors = [
      Color.fromARGB(255, 69, 72, 73),
      Color.fromARGB(255, 97, 104, 107),
      Color.fromARGB(255, 154, 165, 171),
      Color.fromARGB(255, 246, 247, 248),
    ];
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: MaterialColor(
        colors[0].value,
        <int, Color>{
          50: colors[0],
          100: colors[1],
          200: colors[2],
          300: colors[3],
          400: colors[0],
          500: colors[1],
          600: colors[2],
          700: colors[3],
          800: colors[0],
          900: colors[1],
        
        },
      ),
    ),
     home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250.0, // Define the height of the app bar when it is expanded
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: colors,
                  ),
                ),
              ),
              pinned: true,
              title: Text('Título do AppBar'),
            ),
            SliverFillRemaining(
              child: Center(
                child: Text('Bem vindo(a), Usuário!'),
              ),
            ),
          ],
        ),
      ),
      initialRoute: '/splash_screen',
      routes: {
        '/main': (context) => const MyHomePage(title: 'Bem vindo(a), Usuário!'),
        '/login': (context) => LoginPage(),
        '/cadastro': (context) => CadastroPage(), 
        '/splash_screen':(context) => SplashScreen(),
        '/test':(context) => TestPage(),
        '/profile': (context) => ProfilePage(),
        '/gastos': (context) => GastosPage(),
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
                   Color.fromARGB(255, 78, 74, 84)), // Cor de fundo azul
            ),
          ),
           SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              //Navigator.pushNamed(context, '/profile');
            },
            
            child: Text(
              'Adicionar Cartão',
              style: TextStyle(fontSize: 20),
            ),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(300, 80)), // Largura de 200 e altura de 50
              backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255,78, 74, 84)), // Cor de fundo azul
            ),
          ),
           SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/gastos');
            },
            child: Text(
              'Controle de Gastos',
              style: TextStyle(fontSize: 20),

            ),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(300, 80)), // Largura de 200 e altura de 50
              backgroundColor: MaterialStateProperty.all(
                   Color.fromARGB(255, 78, 74, 84)), // Cor de fundo azul
            ),
          ),
           SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Código para lidar com o clique no botão
            },
            child: Text(
              'Adicionar de Transações',
              style: TextStyle(fontSize: 20),
              
            ),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(300, 80)), // Largura de 200 e altura de 50
              backgroundColor: MaterialStateProperty.all(
                   Color.fromARGB(255, 78, 74, 84)), // Cor de fundo azul
            ),
          ),
           SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            
            child: Text(
              'Meu Perfil',
              style: TextStyle(fontSize: 20),
            ),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(300, 80)), // Largura de 200 e altura de 50
              backgroundColor: MaterialStateProperty.all(
                   Color.fromARGB(255, 78, 74, 84)), // Cor de fundo azul
            ),
          ),
           SizedBox(height: 20),
        ])));
  }
}
