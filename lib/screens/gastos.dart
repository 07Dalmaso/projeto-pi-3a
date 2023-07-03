import 'package:flutter/material.dart';
import 'package:proj_pi/common/extensions/sizes.dart';
import 'package:proj_pi/models/trans_model.dart';
import 'package:proj_pi/store/trans_store.dart';
import 'package:provider/provider.dart';
import 'package:proj_pi/services/gastos_service.dart';

class GastosPage extends StatefulWidget {
  @override
  State<GastosPage> createState() => _GastosPageState();
}

class _GastosPageState extends State<GastosPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> valorList = [];
  List<String> transIdList = [];
  List<String> cardNameList = [];
  List<String> descptList = [];
  List<String> dataList = [];

  @override
  void initState() {
    super.initState();
    pegarUser();
    calcularTotal();
  }

  void pegarUser () async{
    GastosService gastoService=GastosService();
    var transData =await gastoService.getGastoByUser();

     List<String> transValors = [];
     List<String> transIds = [];
     List<String> cardNames= [];
     List<String> transDescpts= [];
    List<String> gastoDatas= [];

  for (var gasto in transData) {
    String transValor = gasto['valor'];
    String transId = gasto['transId'];
    String cardName = gasto['cartaoT'];
    String transDescpt = gasto ['descpt'];
    String gastoData = gasto['data'];

    cardNames.add(cardName);
    transIds.add(transId);
    transValors.add(transValor);
    transDescpts.add(transDescpt);
    gastoDatas.add(gastoData);
  }

  setState(() {
    cardNameList = cardNames;
    transIdList = transIds;
    descptList = transDescpts;
    valorList =transValors;
    dataList= gastoDatas;

  });
}

  double total = 0.0;
    void calcularTotal() async {
     GastosService gastoService=GastosService();

    double result = await gastoService.sumValues();
    setState(() {
        total = result;
    });
  }
  bool showBalance = true;

  double get textScaleFactor =>
      MediaQuery.of(context).size.width < 360 ? 0.7 : 1.0;
  double get iconSize => MediaQuery.of(context).size.width < 360 ? 16.0 : 24.0;

  @override
  Widget build(BuildContext context) {
    TranStore tranStore = Provider.of<TranStore>(context);
    final List<TransModel> trans = tranStore.trans;

    List<Color> colors = [
      Color.fromARGB(255, 69, 72, 73)!,
      Color.fromARGB(255, 97, 104, 107)!,
      Color.fromARGB(255, 154, 165, 171)!,
      Color.fromARGB(255, 246, 247, 248)!,
    ];

    double appBarHeight = MediaQuery.of(context).size.height * 0.25;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            expandedHeight: appBarHeight,
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
                            'Gasto total',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(
                          showBalance
                              ? 'R\$ $total'
                              : '******',
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
                  //TransModel tran = trans[index];
                  //final value =tranStore.valor;
                  String cardNamee=cardNameList[index];
               // String cardID=transIdList[index];
                String data=dataList[index];
                String valor=valorList[index];
                String desc=descptList[index];

                  return InkWell(
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
                                Text('Cartão: ${cardNamee}'),
                                Text('Valor: R\$ ${valor}'),
                                Text('Data: ${data}'),
                                Text('Detalhes: ${desc}'),
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
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.credit_card,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  desc,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  cardNamee,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'R\$ ${valor}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                data,
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
                  );
                },
                childCount: transIdList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
