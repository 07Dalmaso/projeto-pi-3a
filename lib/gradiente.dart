import 'package:flutter/material.dart';
import 'dart:ui';

class AppGradients{
  static final List<Color> colors = [
    Color.fromARGB(255, 69, 72, 73),
    Color.fromARGB(255, 97, 104, 107),
    Color.fromARGB(255, 154, 165, 171),
    Color.fromARGB(255, 246, 247, 248),
  ];

  static LinearGradient getLinearGradient(double angle){
    return LinearGradient(
      colors: colors,
      //stops: [0.0, 0.695],
      transform: GradientRotation(angle * 3.14),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(
          AppGradients.colors[0].value,
          <int, Color>{
            50: AppGradients.colors[0],
            100: AppGradients.colors[1],
            200: AppGradients.colors[2],
            300: AppGradients.colors[3],
            400: AppGradients.colors[0],
            500: AppGradients.colors[1],
            600: AppGradients.colors[2],
            700: AppGradients.colors[3],
            800: AppGradients.colors[0],
            900: AppGradients.colors[1],      
          },
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Título do AppBar'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: AppGradients.getLinearGradient(45.0),
            ),
          ),
        ),
      ),
    );
  }
}

