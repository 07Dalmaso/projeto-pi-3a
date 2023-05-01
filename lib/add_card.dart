import 'package:flutter/material.dart';
import 'main.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();
  TextEditingController _cardNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Color.fromARGB(255, 69, 72, 73)!,
      Color.fromARGB(255, 97, 104, 107)!,
      Color.fromARGB(255, 154, 165, 171)!,
      Color.fromARGB(255, 246, 247, 248)!,
    ];
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.17,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: colors,
              ),
            ),
            child: Center(
              child: Text(
                "Adicionar Cartão",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 2.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.045,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.035, // define a altura do container das logos
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset('../assets/imagem/visa.png',
                                      height: 30.0),
                                  Image.asset('../assets/imagem/mastercard.png',
                                      height: 30.0),
                                  Image.asset(
                                      '../assets/imagem/americanExpress.png',
                                      height: 30.0),
                                  Image.asset('../assets/imagem/hipercard.png',
                                      height: 30.0),
                                  Image.asset('../assets/imagem/elo.png',
                                      height: 30.0),
                                  Image.asset('../assets/imagem/hiper.png',
                                      height: 30.0),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 16.0, top: 6.0),
                          child: Text(
                            'Nome do Titular *',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.03,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: TextFormField(
                              controller: _nameController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Insira o nome do titular',
                                hintStyle: TextStyle(fontSize: 16.0),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.085,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 16.0, top: 6.0),
                          child: Text(
                            'CPF/CNPJ',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.03,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: TextFormField(
                              controller: _cpfController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Insira o CPF ou CPNJ',
                                hintStyle: TextStyle(fontSize: 16.0),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.085,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 16.0, top: 6.0),
                          child: Text(
                            'Número do Cartão *',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.03,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: TextFormField(
                              controller: _cardNumberController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Insira o número do cartão',
                                hintStyle: TextStyle(fontSize: 16.0),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 16.0, top: 6.0),
                          child: Text(
                            'Data de Validade *',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.03,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: TextFormField(
                              controller: _dateController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Insira a data de validade',
                                hintStyle: TextStyle(fontSize: 16.0),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 16.0, top: 6.0),
                          child: Text(
                            'Código de Verificação *',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.03,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: TextFormField(
                              controller: _cvvController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Insira o CVV do cartão',
                                hintStyle: TextStyle(fontSize: 16.0),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 16.0, top: 6.0),
                          child: Text(
                            'Nome do Cartão',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.03,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: TextFormField(
                              controller: _cardNameController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Escolha um nome para o cartão',
                                hintStyle: TextStyle(fontSize: 16.0),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.023),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      child: Text('Cancelar'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/main');
                      },
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                          Size(MediaQuery.of(context).size.width * 0.4,
                              MediaQuery.of(context).size.height * 0.07),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ), // add rounded corners and a red border to the button
                        backgroundColor: MaterialStateProperty.all<Color>(Colors
                            .white), // set background color to transparent
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.red), // set text color to red
                      ),
                    ),
                    ElevatedButton(
                      child: Text('Confirmar'),
                      onPressed: () {
                        // Lógica para adicionar o cartão de crédito
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.green), // set background color to green
                        fixedSize: MaterialStateProperty.all<Size>(
                          Size(MediaQuery.of(context).size.width * 0.4,
                              MediaQuery.of(context).size.height * 0.07),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
        ],
      ),
    );
  }
}
