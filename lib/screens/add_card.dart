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
  @override
  Widget build(BuildContext context) {
    final cardStore = Provider.of<CardStore>(context);
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final colors = [
      const Color.fromARGB(255, 69, 72, 73),
      const Color.fromARGB(255, 97, 104, 107),
      const Color.fromARGB(255, 154, 165, 171),
      const Color.fromARGB(255, 246, 247, 248),
    ];
    return Scaffold(
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
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
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
                    // Image.asset(
                    //   '../assets/imagem/visa.png',
                    //   height: 30.0,
                    // ),
                    // Image.asset(
                    //   '../assets/imagem/mastercard.png',
                    //   height: 30.0,
                    // ),
                    // Image.asset(
                    //   '../assets/imagem/americanExpress.png',
                    //   height: 30.0,
                    // ),
                    // Image.asset(
                    //   '../assets/imagem/hipercard.png',
                    //   height: 30.0,
                    // ),
                    // Image.asset(
                    //   '../assets/imagem/elo.png',
                    //   height: 30.0,
                    // ),
                    // Image.asset(
                    //   '../assets/imagem/hiper.png',
                    //   height: 30.0,
                    // ),
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
                      onChanged: cardStore.setCardHolderName,
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
                      onChanged: cardStore.setCardName,
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
                      decoration: const InputDecoration(
                        labelText: 'Últimos 4 dígitos do cartão',
                        hintText: 'Ex: 1111',
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(
                          fontSize: 16.0,
                          color: Color.fromARGB(255, 69, 72, 73)),
                      //initialValue: cardStore.cardNumber,
                      onChanged: cardStore.setCardNumber,
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
                      decoration: InputDecoration(
                        labelText: 'Data de Vencimento',
                        hintText: 'Ex: 06/23',
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Color.fromARGB(255, 69, 72, 73)),
                      //initialValue: cardStore.expirationDate,
                      onChanged: cardStore.setExpirationDate,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira a data de vencimento';
                          // } else {
                          //   // Regular expression pattern for "mm/yyyy" format
                          //   final pattern = r'^\d{2}/\d{2}$';
                          //   final regExp = RegExp(pattern);
                          //   if (!regExp.hasMatch(value)) {
                          //     return 'Insira a data no formato mês/ano';
                          //   }
                          // }
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
                              if (cardStore.isFormValid) {
                                CardService cardService = CardService();
                                await cardService.saveCard1(
                                  cardNumber: cardStore.cardNumber,
                                  cardName: cardStore.cardName,
                                  cardHolderName: cardStore.cardHolderName,
                                  expirationDate: cardStore.expirationDate,
                                );
                                cardStore.saveCard();
                                _formKey.currentState!.reset();

                                Navigator.pushNamed(context, '/cartao');
                              }
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
          ])))
    ]));
  }
}
