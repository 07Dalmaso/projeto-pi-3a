import 'package:flutter/material.dart';
import 'package:proj_pi/services/card_service.dart';

class EditCard extends StatefulWidget {
  final String cardID;

  EditCard({required this.cardID});

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<EditCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _cardNameController = TextEditingController();
  final _cardHolderController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _cardDateController = TextEditingController();

  String? cardName;
  String? cardId;
  String? cardNumber;
  String? cardHolderName;
  String? cardExpirationDate;
  bool _isLoading = false;

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
    String? card_HolderName = cardData['cardHolderName'];
    String? card_ExpirationDate = cardData['expirationDate'];

    setState(() {
      cardName = card_Name;
      cardId = card_Id;
      cardNumber = card_Number;
      cardHolderName = card_HolderName;
      cardExpirationDate = card_ExpirationDate;

      _cardNameController.text = cardName ?? '';
      _cardHolderController.text = cardHolderName ?? '';
      _cardNumberController.text = cardNumber ?? '';
      _cardDateController.text = cardExpirationDate ?? '';
    });
  }

  String _errorEdit = '';

  Future<void> editCard(BuildContext context, String cardId) async {
    setState(() => _errorEdit = '');
    try {

      CardService userService = CardService();

      await userService.updateCard(
        cardId,
        cardHolderName: _cardHolderController.text,
        cardName: _cardNameController.text,
        cardNumber: _cardNumberController.text,
        expirationDate: _cardDateController.text,
      );
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Edição bem-sucedida'),
            content:
                const Text('A edição do seu cartão foi realizada com sucesso!'),
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
    final colors = [
      const Color.fromARGB(255, 69, 72, 73),
      const Color.fromARGB(255, 97, 104, 107),
      const Color.fromARGB(255, 154, 165, 171),
      const Color.fromARGB(255, 246, 247, 248),
    ];
    return Scaffold(
        appBar: null,
        resizeToAvoidBottomInset: true,
        body: Stack(children: [
          CustomScrollView(slivers: <Widget>[
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
                        Navigator.pushNamed(context, '/dados_cartao',
                            arguments: widget.cardID);
                      },
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Editar Cartão",
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
                delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nome do Titular',
                          prefixIcon: Icon(Icons.person),
                          hintText: cardHolderName,
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 69, 72, 73)),
                        controller: _cardHolderController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira o nome do titular do cartão';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.023),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Apelido do Cartão',
                          hintText: cardName,
                          prefixIcon: Icon(Icons.short_text),
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 69, 72, 73)),
                        controller: _cardNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira o apelido do cartão';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.023),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Últimos 4 dígitos do cartão',
                          prefixIcon: Icon(Icons.credit_card),
                          hintText: cardNumber,
                          border: OutlineInputBorder(),
                        ),
                        style: const TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 69, 72, 73)),
                        controller: _cardNumberController,
                        maxLength: 4,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira o número do cartão';
                          } else {
                            if (value.length > 4) {
                              return 'Insira apenas os 4 últimos dígitos';
                            }
                            if (value.length < 4) {
                              return 'Insira os 4 últimos dígitos';
                            }

                            return null;
                          }
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.023),
                      TextFormField(
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          labelText: 'Data de Vencimento',
                          prefixIcon: Icon(Icons.calendar_today),
                          hintText: cardExpirationDate,
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 69, 72, 73)),
                        controller: _cardDateController,
                        onChanged: (value) {
                          if (value.length == 2 &&
                              !_cardDateController.text.endsWith('/')) {
                            _cardDateController.text += '/';
                            _cardDateController.selection =
                                TextSelection.fromPosition(
                              TextPosition(
                                  offset: _cardDateController.text.length),
                            );
                          } else if (value.length >= 5) {
                            _cardDateController.text = value.substring(0, 5);
                            _cardDateController.selection =
                                TextSelection.fromPosition(
                              TextPosition(
                                  offset: _cardDateController.text.length),
                            );
                          }
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira a data de vencimento';
                          } else {
                            final pattern = r'^\d{2}/\d{2}$';
                            final regExp = RegExp(pattern);
                            if (!regExp.hasMatch(value)) {
                              return 'Insira a data no formato mês/ano';
                            }
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.023),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                 setState(() {
                                            _isLoading = true;
                                          });
                                editCard(context, cardId!);
                                Navigator.pushNamed(context, '/dados_cartao',
                                    arguments: widget.cardID);
                              }
                            },
                            child: Text('Salvar'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.green,
                              ),
                              fixedSize: MaterialStateProperty.all<Size>(
                                Size(
                                  MediaQuery.of(context).size.width * 0.4,
                                  MediaQuery.of(context).size.height * 0.07,
                                ),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ]))
          ]),
           if (_isLoading)
            Container(
              color: Colors.black54,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
        ]));
  }
}
