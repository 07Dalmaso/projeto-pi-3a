// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:proj_pi/login_screen.dart';
//import 'package:proj_pi/user.dart';
import 'package:proj_pi/cadastro.dart'; 
import 'package:proj_pi/splash_screen.dart';
//import 'package:proj_pi/test.dart';
import 'package:proj_pi/profile.dart';
import 'package:proj_pi/gastos.dart';
import 'package:proj_pi/score_card.dart';
import 'package:proj_pi/cartao.dart';
import 'package:proj_pi/add_card.dart';
import 'package:proj_pi/add_gastos.dart';
import 'package:proj_pi/add_gastos_1.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {

    List<Color> colors = [
      Color.fromARGB(255, 69, 72, 73)!,
      Color.fromARGB(255, 97, 104, 107)!,
      Color.fromARGB(255, 154, 165, 171)!,
      Color.fromARGB(255, 246, 247, 248)!,
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: const Text('My App'),
        ),
        body: Column(
          children: [
            Container(/*
              //height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: colors,
                ),
              ),
            */),
           const SizedBox(height: 50.0),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ScoreCard(),]
              ),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash_screen',
      routes: {
        '/main': (context) => const MyHomePage(title: 'Bem vindo(a), Usuário!'),
        '/login': (context) => LoginPage(),
        '/cadastro': (context) => CadastroPage(),
        '/splash_screen': (context) => SplashScreen(),
        '/add_Gastos': (context) => Add_Gastos(),
        '/profile': (context) => ProfilePage(),
        '/gastos': (context) => GastosPage(),
        '/cartao': (context) => CartaoPage(),
        '/addCard': (context) => AddCard(),
        '/addGastos': (context) => AddGastos(),
      },
      theme: ThemeData(
      appBarTheme: AppBarTheme(
      color: Color.fromARGB(255, 69, 72, 73),
      elevation: 0,
      toolbarHeight: 150,
      centerTitle: true,
      ))
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
              //crossAxisCount: 2,
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
           SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartao');
            },
            child: Text(
              'Meus Cartões',
              style: TextStyle(fontSize: 20),
              
            ),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(150, 40)), // Largura de 200 e altura de 50
              backgroundColor: MaterialStateProperty.all(
                   Color.fromARGB(255, 78, 74, 84)), // Cor de fundo azul
            ),
          ),
           SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/addCard');
            },
            
            child: Text(
              'Adicionar Cartão',
              style: TextStyle(fontSize: 20),
            ),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(150, 40)), // Largura de 200 e altura de 50
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
                  Size(150, 40)), // Largura de 200 e altura de 50
              backgroundColor: MaterialStateProperty.all(
                   Color.fromARGB(255, 78, 74, 84)), // Cor de fundo azul
            ),
          ),
           SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add_Gastos');
            },
            child: Text(
              'Adicionar de Transações',
              style: TextStyle(fontSize: 20),
              
            ),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(150, 40)), // Largura de 200 e altura de 50
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
                  Size(150, 40)), // Largura de 200 e altura de 50
              backgroundColor: MaterialStateProperty.all(
                   Color.fromARGB(255, 78, 74, 84)), // Cor de fundo azul
            ),
          ),
           SizedBox(height: 20),
        ])));
  }
}