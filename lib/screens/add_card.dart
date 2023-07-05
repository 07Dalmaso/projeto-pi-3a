import 'package:flutter/material.dart';
import 'package:proj_pi/services/card_service.dart';
import 'package:proj_pi/store/card_store.dart';
//import './common/extensions/CustomInputField.dart';
import 'package:provider/provider.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nameHolderController = TextEditingController();
  final _numberController = TextEditingController();
  final _nameCardController = TextEditingController();
  final _dateController = TextEditingController();
  String? cardId;

  @override
  void initState() {
    super.initState();
  }

  String generateCardId() {
    return UniqueKey().toString();
  }

  @override
  Widget build(BuildContext context) {
    //final cardStore = Provider.of<CardStore>(context);
    //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final colors = [
      const Color.fromARGB(255, 69, 72, 73),
      const Color.fromARGB(255, 97, 104, 107),
      const Color.fromARGB(255, 154, 165, 171),
      const Color.fromARGB(255, 246, 247, 248),
    ];
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: CustomScrollView(slivers: <Widget>[
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
                      Navigator.pushNamed(context, '/cartao');
                    },
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Adicionar Cartão",
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
          SliverPadding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
              sliver: SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.070,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/images/visa.png',
                          height: 30.0,
                        ),
                        Image.asset(
                          'assets/images/mastercard.png',
                          height: 30.0,
                        ),
                        Image.asset(
                          'assets/images/americanExpress.png',
                          height: 30.0,
                        ),
                        Image.asset(
                          'assets/images/hipercard.png',
                          height: 30.0,
                        ),
                        Image.asset(
                          'assets/images/elo.png',
                          height: 30.0,
                        ),
                        Image.asset(
                          'assets/images/hiper.png',
                          height: 30.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Nome do Titular',
                            hintText: 'Ex: Sabrina',
                            border: OutlineInputBorder(),
                          ),
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 69, 72, 73)),
                          //initialValue: cardStore.cardHolderName,
                          controller: _nameHolderController,
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
                            hintText: 'Ex: Cartão da Nubank',
                            border: OutlineInputBorder(),
                          ),
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 69, 72, 73)),
                          //initialValue: cardStore.cardName,
                          controller: _nameCardController,
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
                          decoration: const InputDecoration(
                            labelText: 'Últimos 4 dígitos do cartão',
                            hintText: 'Ex: 1111',
                            border: OutlineInputBorder(),
                          ),
                          style: const TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 69, 72, 73)),
                          //initialValue: cardStore.cardNumber,
                          controller: _numberController,
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
                            hintText: 'Ex: 06/23',
                            border: OutlineInputBorder(),
                          ),
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 69, 72, 73),
                          ),
                          // initialValue: cardStore.expirationDate,
                          controller: _dateController,
                          onChanged: (value) {
                            if (value.length == 2 &&
                                !_dateController.text.endsWith('/')) {
                              _dateController.text += '/';
                              _dateController.selection =
                                  TextSelection.fromPosition(
                                TextPosition(
                                    offset: _dateController.text.length),
                              );
                            }
                            else if (value.length >= 5) {
                              _dateController.text = value.substring(0, 5);
                              _dateController.selection =
                                  TextSelection.fromPosition(
                                TextPosition(
                                    offset: _dateController.text.length),
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
                                  CardService cardService = CardService();
                                  final String cardId = generateCardId();

                                  await cardService.saveCard1(
                                    cardId: cardId,
                                    cardNumber: _numberController.text,
                                    cardName: _nameCardController.text,
                                    cardHolderName: _nameHolderController.text,
                                    expirationDate: _dateController.text,
                                  );
                                  //cardStore.saveCard();
                                  _formKey.currentState!.reset();

                                  Navigator.pushNamed(context, '/cartao');
                                }
                              },
                              child: Text('Salvar'),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
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
              ])))
        ]));
  }
}
