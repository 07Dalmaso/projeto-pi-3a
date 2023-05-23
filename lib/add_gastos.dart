import 'package:flutter/material.dart';
import 'package:proj_pi/add_gastos_1.dart';
import './common/extensions/CustomInputField.dart';
//import 'main.dart';

class AddGastos extends StatefulWidget {
  @override
  _AddGastosState createState() => _AddGastosState();
}

class _AddGastosState extends State<AddGastos> {
  TextEditingController _valueController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _descpt_Controller = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

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
                               "Saldo: R\$254,69",
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        )
    ),
  ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
Padding(
  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
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
            width: 3.0,
          ),
        ),
        child: Center(
          child: Text(
            'Cartão Selecionado',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 18.0),
          child: CustomInputField(
            label: 'Banco do Brasil',
            hintText: 'Banco do b5225 *** **** 5123',
            controller: _nameController,
          ),
        ),
    ],
  ),
),
                SizedBox(height: 30.0),
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
                            'Valor da Transação *',
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
                              controller: _valueController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText:   'Ex: R\$100,00',
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
                            'Data da transação *',
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
                                hintText: 'Ex: 01/05/2023',
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
                            'Descrição da Transação',
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
                              controller: _descpt_Controller,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Ex: Compra do mês no Carrefour',
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
                SizedBox(height: 20.0),
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
                        Navigator.pushNamed(context, '/gastos');
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
             ]
           )
      )]));
  }
}