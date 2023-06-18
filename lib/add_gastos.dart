import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transaction {
  final double value;
  final DateTime date;
  final String description;

  Transaction(this.value, this.date, this.description);
}

class AddGastos extends StatefulWidget {
  @override
  _AddGastosState createState() => _AddGastosState();
}

class _AddGastosState extends State<AddGastos> {
  TextEditingController _valueController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _descpt_Controller = TextEditingController();

  List<Transaction> transactions = [];

void saveTransaction() {
  double? value = double.tryParse(_valueController.text);
  DateTime? date = DateFormat('dd/MM/yyyy').parseStrict(_dateController.text);
  String description = _descpt_Controller.text;

  if (value != null && date != null && description.isNotEmpty) {
    Transaction transaction = Transaction(value, date, description);
    transactions.add(transaction);

    _valueController.clear();
    _dateController.clear();
    _descpt_Controller.clear();

    print('Transação salva localmente: $transaction, $value, $date, $description');
    print(transactions);


    Navigator.pushNamed(context, '/gastos', arguments: transactions);
  } else {
    print('erro ao salvar');
  }
}

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Color.fromARGB(255, 69, 72, 73)!,
      Color.fromARGB(255, 97, 104, 107)!,
      Color.fromARGB(255, 154, 165, 171)!,
      Color.fromARGB(255, 246, 247, 248)!,
    ];
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 16.0),
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
                              '\t\t\tCartão Banco do Brasil',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromARGB(255, 69, 72, 73)),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              '\t\t\t5225 *** **** 5123',
                              style:
                                  TextStyle(fontSize: 16.0, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Valor da Transação',
                            hintText: 'Ex: RS100,00',
                            border: OutlineInputBorder(),
                          ),
                          style: const TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 69, 72, 73)),
                          controller: _valueController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Data da transação',
                            hintText: 'Ex: 21/06/2023',
                            border: OutlineInputBorder(),
                          ),
                          style: const TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 69, 72, 73)),
                          controller: _dateController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Descrição da transação',
                            hintText: 'Ex: Compra do mês carrefour',
                            border: OutlineInputBorder(),
                          ),
                          style: const TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 69, 72, 73)),
                          controller: _descpt_Controller,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.023),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            child: Text('Confirmar'),
                            onPressed: saveTransaction,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
