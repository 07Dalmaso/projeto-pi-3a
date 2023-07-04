import 'package:flutter/material.dart';
import 'package:proj_pi/models/card_model.dart';
import 'package:proj_pi/services/gastos_service.dart';
import 'package:proj_pi/store/card_store.dart';
import 'package:proj_pi/store/trans_store.dart';
import 'package:provider/provider.dart';
import 'package:proj_pi/services/card_service.dart';

class AddGastos extends StatefulWidget {
  final String cardID;

  AddGastos({required this.cardID});
  @override
  _AddGastosState createState() => _AddGastosState();
}

class _AddGastosState extends State<AddGastos> {

   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   String cardName = '';
  String cardId = '';
  String cardNumber = '';

  final _valueController = TextEditingController();
  final _descptController = TextEditingController();
  final _dateController = TextEditingController();
  String? transdId;

  @override
  void initState() {
    super.initState();
    pegarCardId();
  }

  void pegarCardId() async {
    CardService cardService = CardService();
    var cardData = await cardService.getCardById(widget.cardID);
    print(cardData);
    String? card_Name = cardData['cardName'];
    String? card_Id = cardData['cardId'];
    String? card_Number = cardData['cardNumber'];

    setState(() {
      cardName = card_Name ?? '';
      cardId = card_Id ?? '';
      cardNumber = card_Number ?? '';
    });
  }

    String generateGastoId() {
  return UniqueKey().toString();
}
  
  @override
  Widget build(BuildContext context) {
   //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   //final cardStore = Provider.of<CardStore>(context);
   //final CardModel? card = cardStore.getCardById(widget.cardID);
   // final tranStore = Provider.of<TranStore>(context);

   // tranStore.setCard(cardName);

    List<Color> colors = [
      Color.fromARGB(255, 69, 72, 73)!,
      Color.fromARGB(255, 97, 104, 107)!,
      Color.fromARGB(255, 154, 165, 171)!,
      Color.fromARGB(255, 246, 247, 248)!,
    ];
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CustomScrollView( slivers: <Widget>[
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
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/add_Gastos');
                },
              ),
              const Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Adicionar transação",
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
      SliverList(
        delegate: SliverChildListDelegate(
          [
            const SizedBox(height: 20.0),
            const Center(
              child: Text(
                'Cartão Selecionado',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
              child: SizedBox(
                height: 70.0,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\t\t\t' + cardName!,
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Color.fromARGB(255, 69, 72, 73)),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '\t\t\t**** **** **** ' + cardNumber!,
                          style: TextStyle(fontSize: 16.0, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
              Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Valor da transação',
                        hintText: 'Ex: 100',
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Color.fromARGB(255, 69, 72, 73)),
                      //initialValue: tranStore.valor,
                      controller: _valueController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira o valor da transação';
                        }
                        return null;
                      },
                    ),
                   SizedBox(
                        height: MediaQuery.of(context).size.height * 0.023),
                    TextFormField(
                       keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                        labelText: 'Data da transação',
                        hintText: 'Ex: 21/06/2023',
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Color.fromARGB(255, 69, 72, 73)),
                      // initialValue: tranStore.data,
                      controller: _dateController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira a data da transação';
                           } else {
                           final pattern = r'^\d{2}/\d{2}/\d{4}$';
                          final regExp = RegExp(pattern);
                          if (!regExp.hasMatch(value)) {
                              return 'Insira a data no formato dia/mês/ano';
                           }
                        }
                        return null;
                      },
                    ),
                 SizedBox(
                        height: MediaQuery.of(context).size.height * 0.023),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Descrição da transação',
                        hintText: 'Ex: Alimentação',
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Color.fromARGB(255, 69, 72, 73)),
                      //initialValue: tranStore.descpt,
                      controller: _descptController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira uma descrição para a transação';
                        }
                        return null;
                      },
                    ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.023,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                           
                              GastosService gastosService = GastosService();

                              final String transId = generateGastoId();

                              await gastosService.saveGastos1(
                                valor: _valueController.text,
                                data: _dateController.text,
                                descpt: _descptController.text,
                                transId: transId,
                                cartaoT: cardName,
                                
                              );

                              //tranStore.saveTrasaction();
                             // _formKey.currentState!.reset();

                              Navigator.pushNamed(context, '/gastos');
                            }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.4,
                            MediaQuery.of(context).size.height * 0.07,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text('Confirmar'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        )],
        ),
      ),
    ]));
  }
}
