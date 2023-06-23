import 'package:flutter/material.dart';
//import './common/extensions/CustomInputField.dart';
import 'package:provider/provider.dart';
import './store/card_store.dart';
import './models/card_model.dart';

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
    final cardStore = Provider.of<CardStore>(context);
    final List<CardModel> cards = cardStore.cards;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    List<Color> colors = [
      Color.fromARGB(255, 69, 72, 73),
      Color.fromARGB(255, 97, 104, 107),
      Color.fromARGB(255, 154, 165, 171),
      Color.fromARGB(255, 246, 247, 248),
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
                      "Adicionar Transações",
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
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              CardModel card = cards[index];
              return Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/addGastos',
                        arguments: card.cardId);
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 14.0),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Color.fromARGB(31, 53, 49, 49),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          card.cardName,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 69, 72, 73),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '**** **** **** ' + card.cardNumber,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            childCount: cards.length,
          ),
        ),
      ],
    ));
  }
}
