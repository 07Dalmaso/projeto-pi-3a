import 'package:flutter/material.dart';
import './common/extensions/CustomInputField.dart';

class Add_Gastos extends StatefulWidget {
  @override
  _AddGastosState createState() => _AddGastosState();
}

class _AddGastosState extends State<Add_Gastos> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
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
                "Adicionar Transações",
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
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: Center(
                        child: Text(
                               "Selecione um cartão",
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        )
    ),
                        ),
                      ),
          Padding(
  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: InkWell(
    onTap: () {
      Navigator.pushNamed(context, '/addGastos');
    },
        child: CustomInputField(
          label: 'Cartão Banco do Brasil',
          hintText: '5225 *** **** 5123',
          controller: _nameController,
        ),
      ),
      )
    ],
  ),
),
                Padding(
  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: InkWell(
    onTap: () {
      Navigator.pushNamed(context, '/addGastos');
    },
        child: CustomInputField(
          label: 'Cartão Banco do Brasil',
          hintText: '5225 *** **** 5123',
          controller: _nameController,
        ),
      ),
      )
    ],
  ),
),
                Padding(
  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: InkWell(
    onTap: () {
      Navigator.pushNamed(context, '/addGastos');
    },
        child: CustomInputField(
          label: 'Cartão Banco do Brasil',
          hintText: '5225 *** **** 5123',
          controller: _nameController,
        ),
      ),
      )
    ],
  ),
),
                Padding(
  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: InkWell(
    onTap: () {
      Navigator.pushNamed(context, '/addGastos');
    },
        child: CustomInputField(
          label: 'Cartão Banco do Brasil',
          hintText: '5225 *** **** 5123',
          controller: _nameController,
        ),
      ),
      )
    ],
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
                  ],
                ),
              ],
            ),
          )
              ]
    )
             )
        ]));
  }
}
