import 'package:flutter/material.dart';
//import './common/extensions/CustomInputField.dart';
import 'card_store.dart';


class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

  class _AddCardState extends State<AddCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CardStore _cardStore = CardStore();

  @override
  Widget build(BuildContext context) {
    final colors = [
      const Color.fromARGB(255, 69, 72, 73),
      const Color.fromARGB(255, 97, 104, 107),
      const Color.fromARGB(255, 154, 165, 171),
      const Color.fromARGB(255, 246, 247, 248),
    ];
     return Scaffold(
  body: CustomScrollView(
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
              delegate: SliverChildListDelegate(
                [
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
                                    '../assets/imagem/visa.png',
                                    height: 30.0,
                                  ),
                                  Image.asset(
                                    '../assets/imagem/mastercard.png',
                                    height: 30.0,
                                  ),
                                  Image.asset(
                                    '../assets/imagem/americanExpress.png',
                                    height: 30.0,
                                  ),
                                  Image.asset(
                                    '../assets/imagem/hipercard.png',
                                    height: 30.0,
                                  ),
                                  Image.asset(
                                    '../assets/imagem/elo.png',
                                    height: 30.0,
                                  ),
                                  Image.asset(
                                    '../assets/imagem/hiper.png',
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
                  labelText: 'Número do Cartão',
                ),
                onChanged: _cardStore.setCardNumber,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o número do cartão';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome do Cartão',
                ),
                onChanged: _cardStore.setCardName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o nome do cartão';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome do Titular',
                ),
                onChanged: _cardStore.setCardHolderName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o nome do titular do cartão';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Data de Validade',
                ),
                onChanged: _cardStore.setExpirationDate,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira a data de validade';
                  }
                  return null;
                },
              ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.023),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     ElevatedButton(
                  onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _cardStore.saveCard();
                                    if (_cardStore.isFormValid) {
                                      _cardStore.saveCard();
                                      _formKey.currentState!.reset();
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
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ), // add rounded corners to the button
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
    ))]));
  }
}