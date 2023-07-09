import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proj_pi/services/user_service.dart';
import 'package:proj_pi/widgets/customappbar.dart';
import 'package:proj_pi/services/gastos_service.dart';

final List<Color> colors = [
  const Color.fromARGB(255, 69, 72, 73),
  const Color.fromARGB(255, 97, 104, 107),
  const Color.fromARGB(255, 154, 165, 171),
  const Color.fromARGB(255, 246, 247, 248),
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showBalance = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserService userService = UserService();
  final userId = FirebaseAuth.instance.currentUser?.uid as String;

  String? userName;
  String? email;
  String? cpf;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    pegarUserId();
    calcularTotal();
  }

  void pegarUserId() async {
    UserService userService = UserService();
    var userData = await userService.getUser(userId);
    String? user_Name;
    String? user_email;
    String? user_Cpf;
    if (userData != null) {
     // user_Name = userData.name;
      //user_email = userData.email;
      //user_Cpf = userData.cpf;
      user_Name = userData['name'];
    user_email = userData['email'];
    user_Cpf = userData['cpf'];
    }

    setState(() {
      userName = user_Name;
      cpf = user_Cpf;
      email = user_email;
      _isLoading = false;
    });
  }

  double total = 0.0;
  void calcularTotal() async {
    GastosService gastosService = GastosService();
    double result = await gastosService.sumValues();
    print(result);
    setState(() {
      total = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Bem vindo(a) ${userName ?? ''}',
          automaticallyImplyLeading: false),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Column(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${userName ?? ''}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              'Gasto Total: ${showBalance ? 'R\$ $total' : '******'}',
                              textAlign: TextAlign.center,
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
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
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    minimumSize: Size(150, 50),
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
