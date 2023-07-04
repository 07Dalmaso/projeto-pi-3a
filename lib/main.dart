import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proj_pi/screens/add_card.dart';
import 'package:proj_pi/screens/add_gastos.dart';
import 'package:proj_pi/screens/add_gastos_1.dart';
import 'package:proj_pi/screens/alterar_perfil.dart';
import 'package:proj_pi/screens/cadastro.dart';
import 'package:proj_pi/screens/cartao.dart';
import 'package:proj_pi/screens/dados_cartao.dart';
import 'package:proj_pi/screens/editar_cartao.dart';
import 'package:proj_pi/screens/firebase_options.dart';
import 'package:proj_pi/screens/gastos.dart';
import 'package:proj_pi/screens/home.dart';
import 'package:proj_pi/screens/login_screen.dart';
import 'package:proj_pi/screens/profile.dart';
import 'package:proj_pi/screens/senha.dart';
import 'package:proj_pi/screens/splash_screen.dart';
import 'package:proj_pi/store/card_store.dart';
import 'package:proj_pi/store/user_store.dart';
import 'package:proj_pi/store/trans_store.dart';
import 'package:provider/provider.dart';
import 'package:proj_pi/services/gastos_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (context) => CardStore()),
          Provider(create: (context) => UserStore()),
          Provider(create: (context) => TranStore()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/splash_screen',
            routes: {
              '/main': (context) => MyHomePage(title: ' '),
              '/login': (context) => LoginPage(),
              '/cadastro': (context) => CadastroPage(),
              '/splash_screen': (context) => SplashScreen(),
              '/add_Gastos': (context) => Add_Gastos(),
              '/profile': (context) => ProfilePage(),
              '/alt_perfil': (context) {
                final userId =
                    ModalRoute.of(context)!.settings.arguments as String;
                return UpdateProfileScreen(userId: userId);
              },
              '/gastos': (context) => GastosPage(),
              '/cartao': (context) => CartaoPage(),
              '/dados_cartao': (context) {
                final cardId =
                    ModalRoute.of(context)!.settings.arguments as String;
                return DadosCartaoPage(cardID: cardId);
              },
              '/addCard': (context) => AddCard(),
              '/addGastos': (context) {
                final cardId =
                    ModalRoute.of(context)!.settings.arguments as String;
                return AddGastos(cardID: cardId);
              },
              '/editar_cartao': (context) {
                final cardId =
                    ModalRoute.of(context)!.settings.arguments as String;
                return EditCard(cardID: cardId);
              },
              '/senha': (context) => SenhaPage(),
            }));
  }
}
