import 'package:flutter/material.dart';
import 'package:proj_pi/login_screen.dart';
import 'package:proj_pi/cadastro.dart';
import 'package:proj_pi/splash_screen.dart';
import 'package:proj_pi/profile.dart';
import 'package:proj_pi/gastos.dart';
import 'package:proj_pi/score_card.dart';
import 'package:proj_pi/cartao.dart';
import 'package:proj_pi/add_card.dart';
import 'package:proj_pi/add_gastos.dart';
import 'package:proj_pi/add_gastos_1.dart';
import 'package:proj_pi/alterar_perfil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash_screen',
      routes: {
        '/main': (context) => const MyHomePage(title: 'Bem vindo(a), Usuário!'),
        '/login': (context) => LoginPage(),
        '/cadastro': (context) => CadastroPage(),
        '/splash_screen': (context) => SplashScreen(),
        '/add_Gastos': (context) => Add_Gastos(),
        '/profile': (context) => ProfilePage(),
        '/alt_perfil': (context) => UpdateProfileScreen(),
        '/gastos': (context) => GastosPage(),
        '/cartao': (context) => CartaoPage(),
        '/addCard': (context) => AddCard(),
        '/addGastos': (context) => AddGastos(),
      },
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool automaticallyImplyLeading;

  const CustomAppBar({
    required this.title,
    this.automaticallyImplyLeading = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(150);

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      const Color.fromARGB(255, 69, 72, 73),
      const Color.fromARGB(255, 97, 104, 107),
      const Color.fromARGB(255, 154, 165, 171),
      const Color.fromARGB(255, 246, 247, 248),
    ];

    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      const Color.fromARGB(255, 69, 72, 73),
      const Color.fromARGB(255, 97, 104, 107),
      const Color.fromARGB(255, 154, 165, 171),
      const Color.fromARGB(255, 246, 247, 248),
    ];

    return Scaffold(
      appBar: CustomAppBar(title: "Bem-Vindo", automaticallyImplyLeading:false),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('caminho/para/imagem.jpg'),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nome do Usuário',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Saldo: R\$ 1.000,00',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cartao');
                      },
                      icon: Icon(Icons.credit_card),
                      label: Text(
                        'Meus Cartões',
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 100),
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      icon: Icon(Icons.person),
                      label: Text(
                        'Meu Perfil',
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 100),
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/gastos');
                      },
                      icon: Icon(Icons.money),
                      label: Text(
                        'Controle de Gastos',
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 100),
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/add_Gastos');
                      },
                      icon: Icon(Icons.add_circle),
                      label: Text(
                        'Adicionar Transações',
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 100),
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Ação do botão Voltar
                },
                icon: Icon(Icons.arrow_back),
                label: Text('Voltar'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
                icon: Icon(Icons.exit_to_app),
                label: Text('Sair'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
