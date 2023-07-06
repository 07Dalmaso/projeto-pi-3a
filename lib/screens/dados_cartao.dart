import 'package:flutter/material.dart';
import 'package:proj_pi/services/card_service.dart';

class DadosCartaoPage extends StatefulWidget {
  final String cardID;

  DadosCartaoPage({required this.cardID});

  @override
  _DadosCartaoPageState createState() => _DadosCartaoPageState();
}

class _DadosCartaoPageState extends State<DadosCartaoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? cardName;
  String? cardId;
  String? cardNumber;
  String? cardHolderName;
  String? cardExpirationDate;

  @override
  void initState() {
    super.initState();
    pegarCardId();
  }

  void pegarCardId() async {
    CardService cardService = CardService();
    var cardData = await cardService.getCardById(widget.cardID);
    String? card_Name = cardData['cardName'];
    String? card_Id = cardData['cardId'];
    String? card_Number = cardData['cardNumber'];
    String? card_HolderName = cardData['cardHolderName'];
    String? card_ExpirationDate = cardData['expirationDate'];

    setState(() {
      cardName = card_Name;
      cardId = card_Id;
      cardNumber = card_Number;
      cardHolderName = card_HolderName;
      cardExpirationDate = card_ExpirationDate;
    });
  }

  void updateCardData(Map<String, String> updatedData) {
    // Update the state variables with the received updated data
    setState(() {
      cardName = updatedData['cardName'];
      cardNumber = updatedData['cardNumber'];
      cardHolderName = updatedData['cardHolderName'];
      cardExpirationDate = updatedData['expirationDate'];
    });
  }

  List<Color> colors = [
    Color.fromARGB(255, 69, 72, 73)!,
    Color.fromARGB(255, 97, 104, 107)!,
    Color.fromARGB(255, 154, 165, 171)!,
    Color.fromARGB(255, 246, 247, 248)!,
  ];

  void deleteCard(String id) async{
     CardService cardService = CardService();
     cardService.deleteCardById(id);
  }


   String _errorEdit = '';

  Future<void> showDeleteSuccessMessage(BuildContext context) async {
    setState(() => _errorEdit = '');

    try {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Deleção bem-sucedida'),
            content:
                const Text('A deleção do seu cartão foi realizada com sucesso!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      setState(() => _errorEdit = e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
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
                      Navigator.pushNamed(context, '/cartao');
                    },
                  ),
                  const Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Dados do Cartão",
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: TextFormField(
                            enabled: false,
                            decoration: const InputDecoration(
                              labelText: 'Nome do Titular',
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                            ),
                            style: const TextStyle(
                                fontSize: 16.0,
                                color: Color.fromARGB(255, 69, 72, 73)),
                            controller:
                                  TextEditingController(text: cardHolderName),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: TextFormField(
                            enabled: false,
                            decoration: const InputDecoration(
                              labelText: 'Nome do Cartão',
                              prefixIcon: Icon(Icons.short_text),
                              border: OutlineInputBorder(),
                            ),
                            style: const TextStyle(
                                fontSize: 16.0,
                                color: Color.fromARGB(255, 69, 72, 73)),
                                 controller:
                                  TextEditingController(text: cardName),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: TextFormField(
                            enabled: false,
                            decoration: const InputDecoration(
                              labelText: 'Número do Cartão',
                              prefixIcon: Icon(Icons.credit_card),
                              border: OutlineInputBorder(),
                            ),
                            style: const TextStyle(
                                fontSize: 16.0,
                                color: Color.fromARGB(255, 69, 72, 73)),
                            controller:
                                  TextEditingController(text: cardNumber),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: TextFormField(
                            enabled: false,
                            decoration: const InputDecoration(
                              labelText: 'Data de validade',
                              prefixIcon: Icon(Icons.calendar_today),
                              border: OutlineInputBorder(),
                            ),
                            style: const TextStyle(
                                fontSize: 16.0,
                                color: Color.fromARGB(255, 69, 72, 73)),
                            controller:
                                  TextEditingController(text: cardExpirationDate),
                          ),
                        ),
                        const SizedBox(height: 100.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                         var updatedData = await Navigator.pushNamed(
                        context,
                        '/editar_cartao',
                        arguments: cardId,
                        ) as Map<String, String>?;

                        if (updatedData != null) {
                       updateCardData(updatedData);
                         }
                          },
                                child: Container(
                                  padding: EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Editar Cartão',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  deleteCard(widget.cardID);

                                  Navigator.pushNamed(context, '/cartao',
                                          arguments: cardId);

                                  showDeleteSuccessMessage(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Excluir Cartão',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
