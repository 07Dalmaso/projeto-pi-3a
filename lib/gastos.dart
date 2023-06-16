import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:proj_pi/common/extensions/sizes.dart';

class Transaction {
  final String cardName;
  final double value;
  final String date;

  Transaction({
    required this.cardName,
    required this.value,
    required this.date,
  });
}

class GastosPage extends StatefulWidget {
  const GastosPage({Key? key});

  @override
  State<GastosPage> createState() => _GastosPageState();
}

class _GastosPageState extends State<GastosPage> {
  bool showBalance = true;
  double get textScaleFactor =>
      MediaQuery.of(context).size.width < 360 ? 0.7 : 1.0;
  double get iconSize => MediaQuery.of(context).size.width < 360 ? 16.0 : 24.0;

  List<Transaction> transactions = [
    Transaction(
      cardName: 'Cartão A',
      value: -120.0,
      date: '12/06/2023',
    ),
    Transaction(
      cardName: 'Cartão B',
      value: -45.0,
      date: '10/06/2023',
    ),
    Transaction(
      cardName: 'Cartão C',
      value: -200.0,
      date: '08/06/2023',
    ),
    Transaction(
      cardName: 'Cartão D',
      value: -80.0,
      date: '06/06/2023',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Color.fromARGB(255, 69, 72, 73)!,
      Color.fromARGB(255, 97, 104, 107)!,
      Color.fromARGB(255, 154, 165, 171)!,
      Color.fromARGB(255, 246, 247, 248)!,
    ];
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight,
                  colors: colors,
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, '/main');
                    },
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Histórico de Gastos",
                        style: TextStyle(
                          color: Color.fromARGB(255, 206, 202, 202),
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.0),
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
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 3),
                          Text(
                            'Saldo',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(
                          showBalance ? 'R\$ 1.000,00' : '******',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          showBalance ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey[600],
                        ),
                        onPressed: () {
                          setState(() {
                            showBalance = !showBalance;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 36.h),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final transaction = transactions[index];
                  final value = transaction.value.toStringAsFixed(2);
                  final color =
                      transaction.value < 0 ? Colors.red : Colors.green;
                  return InkWell(
                    borderRadius: BorderRadius.circular(16.0),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Detalhes da transação'),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Cartão: ${transaction.cardName}'),
                                Text('Valor: $value'),
                                Text('Data: ${transaction.date}'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                child: Text('Fechar'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 8.0),
                      leading: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(
                          Icons.credit_card,
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction.cardName,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        transaction.date,
                      ),
                      trailing: Text(
                        value,
                        style: TextStyle(
                          color: color,
                        ),
                      ),
                    ),
                  );
                },
                childCount: transactions.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
