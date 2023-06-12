//import 'dart:developer';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proj_pi/common/extensions/sizes.dart';

class GastosPage extends StatefulWidget {
  const GastosPage({super.key});

  @override
  State<GastosPage> createState() => _GastosPageState();
}

class _GastosPageState extends State<GastosPage> {
  bool showBalance = true;
  double get textScaleFactor =>
      MediaQuery.of(context).size.width < 360 ? 0.7 : 1.0;
  double get iconSize => MediaQuery.of(context).size.width < 360 ? 16.0 : 24.0;
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Color.fromARGB(255, 69, 72, 73)!,
      Color.fromARGB(255, 97, 104, 107)!,
      Color.fromARGB(255, 154, 165, 171)!,
      Color.fromARGB(255, 246, 247, 248)!,
    ];
     return Scaffold(
  body: Stack(
    children: [
      Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: colors,
              ),
            ),
            child: Center(
              child: Text(
                "Histórico de Gastos",
                style: TextStyle(
                  color: Color.fromARGB(255, 206, 202, 202),
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Saldo',
                textScaleFactor: textScaleFactor,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              Visibility(
                visible: showBalance,
                child: Text(
                  '\$ 1,500.89',
                  textScaleFactor: textScaleFactor,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          TextButton(
            onPressed: () {
              setState(() {
                showBalance = !showBalance;
              });
            },
            child: Text(
              showBalance ? 'Ocultar saldo' : 'Mostrar saldo',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 36.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.06),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                      size: iconSize,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  const SizedBox(width: 4.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saldo',
                        textScaleFactor: textScaleFactor,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '\$ 1,840.00',
                        textScaleFactor: textScaleFactor,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
                      Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.06),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                      size: iconSize,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  const SizedBox(width: 4.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Despesas',
                        textScaleFactor: textScaleFactor,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '\$ 2,824.00',
                        textScaleFactor: textScaleFactor,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ]
          ),
    ]),
          Positioned(
            top: 387.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                SizedBox(height: 170.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const 
                    [
                      //SizedBox(height: 50.0),
                      Text(
                        'Histórico de transações',
                      ),
                      //SizedBox(height: 50.0),
                      Text(
                        'Ver Tudo',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                    //index % 2 == 0 ? Colors.green : Colors.red;
                      final value =
                          index % 2 == 0 ? "+ \$ 100.00" : "- \$ 100.00";
                          index % 2 == 0 ? Colors.green : Colors.red;
                      return ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                        leading: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: const Icon(
                            Icons.monetization_on_outlined,
                          ),
                        ),
                        title: const Text(
                          'Data',
                        ),
                        subtitle: const Text(
                          '02-07-2023',
                        ),
                        trailing: Text(
                          value,
                        ),
                      );
                    },
                  ),
                ),
                //SizedBox(height: 5.0),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0, left:12.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/main');
              },
              icon: Icon(Icons.arrow_back),
              label: Text('Voltar'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 215, 207, 206)),
            ),
          ),
        )
      ]
     ),
   ),
   //SizedBox(height: 5.0),
  ]
   ),
     );
  }
}
