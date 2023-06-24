import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proj_pi/firebase_options.dart';
import 'package:proj_pi/login_screen.dart';
import 'package:proj_pi/cadastro.dart';
import 'package:proj_pi/splash_screen.dart';
import 'package:proj_pi/profile.dart';
import 'package:proj_pi/gastos.dart';
import 'package:proj_pi/cartao.dart';
import 'package:proj_pi/add_card.dart';
import 'package:proj_pi/add_gastos.dart';
import 'package:proj_pi/add_gastos_1.dart';
import 'package:proj_pi/alterar_perfil.dart';
import 'package:proj_pi/editar_cartao.dart';
import 'package:proj_pi/dados_cartao.dart';
import 'package:proj_pi/store/card_store.dart';
import 'package:proj_pi/store/user_store.dart';
import 'package:proj_pi/store/trans_store.dart';
import 'package:proj_pi/models/trans_model.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  final cardStore = CardStore();
  final userStore = UserStore();
  final tranStore = TranStore();
 
 runApp(
      MyApp(cardStore: cardStore, userStore: userStore, tranStore: tranStore));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  final CardStore cardStore;
  final UserStore userStore;
  final TranStore tranStore;

   MyApp({Key? key, required this.cardStore, required this.userStore, required this.tranStore,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        Provider<CardStore>.value(value: cardStore),
        Provider<UserStore>.value(value: userStore),
        Provider<TranStore>.value(value: tranStore),
      ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/splash_screen',
          routes: {
            '/main': (context) =>MyHomePage(title: ' '),
            '/login': (context) => LoginPage(),
            '/cadastro': (context) => CadastroPage(),
            '/splash_screen': (context) => SplashScreen(),
            '/add_Gastos': (context) => Add_Gastos(),
            '/profile': (context) {
            final userStore = Provider.of<UserStore>(context);
            final userId = userStore.isLoggedin;
            return ProfilePage(userId: userId);
           },
            '/alt_perfil': (context) => UpdateProfileScreen(),
            '/gastos': (context) => GastosPage(),
            '/cartao': (context) =>CartaoPage(),
            '/dados_cartao': (context) {
            final cardId = ModalRoute.of(context)!.settings.arguments as String;
            return DadosCartaoPage(cardId: cardId);
          },
            '/addCard': (context) => AddCard(),
            '/addGastos': (context) {
              final cardId = ModalRoute.of(context)!.settings.arguments as String;
            return AddGastos(cardId: cardId);
          },
          '/editar_cartao': (context) {
            final cardId = ModalRoute.of(context)!.settings.arguments as String;
            return EditCard(cardId: cardId);
          },
  }));
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
    bool showBalance = true; 
  @override
  Widget build(BuildContext context) {
     //UserStore userStore = Provider.of<UserStore>(context);
     TranStore tranStore= Provider.of<TranStore>(context);
     /*final String identifier= userStore.isLoggedin;
     final user = userStore.getUserById(identifier);*/

    final List<Color> colors = [
      const Color.fromARGB(255, 69, 72, 73),
      const Color.fromARGB(255, 97, 104, 107),
      const Color.fromARGB(255, 154, 165, 171),
      const Color.fromARGB(255, 246, 247, 248),
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Bem vindo, Usuário', automaticallyImplyLeading: false),
         // title: 'Bem vindo(a), ${user?.name}', automaticallyImplyLeading: false), //(funciona p/ mobx)
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.only(top: 20, left: 12, right: 12),
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
                        'Usuário',
                        //user?.name as String, //(funciona p/mobx)
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Gasto Total:${showBalance ? 'R\$ ${tranStore.calcularTotal.toStringAsFixed(2)}' : '******'}',

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
                  // AÃ§Ã£o do botÃ£o Voltar
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
