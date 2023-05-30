import 'package:flutter/material.dart';
import './common/extensions/CustomInputField.dart';
import 'main.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _cardNameController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _nameController.dispose();
    _cpfController.dispose();
    _dateController.dispose();
    _cvvController.dispose();
    _cardNameController.dispose();
    super.dispose();
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
                  Navigator.pushNamed(context, '/main');
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
                      height: MediaQuery.of(context).size.height * 0.045,
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
                    padding: const EdgeInsets.only(top: 16.0),
                    child: CustomInputField(
                      label: 'Nome do Titular *',
                      hintText: 'Insira o nome do titular',
                      controller: _nameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: CustomInputField(
                      label: 'CPF/CNPJ',
                      hintText: 'Insira o CPF ou CNPJ',
                      controller: _cpfController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: CustomInputField(
                      label: 'Numero do Cartão*',
                      hintText: 'Insira o numero do cartão',
                      controller: _cardNumberController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: CustomInputField(
                      label: 'Data de Validade *',
                      hintText: 'Insira a data de validade',
                      controller: _dateController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: CustomInputField(
                      label: 'Código de Verificação *',
                      hintText: 'Insira o CVV do cartão',
                      controller: _cvvController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: CustomInputField(
                      label: 'Nome do Cartão',
                      hintText: 'Insira o nome do cartão',
                      controller: _cardNameController,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.023),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        child: Text('Confirmar'),
                        onPressed: () {
                          // Lógica para adicionar o cartão de crédito
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.green,
                          ), // set background color to green
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
    );
  }
}