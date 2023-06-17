import 'package:flutter/material.dart';
import 'card_store.dart';

class CartaoPage extends StatelessWidget {
  final CardStore cardStore;
  final List<String> ids;

  const CartaoPage({required this.cardStore, required this.ids});

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
                    "Meus Cartões",
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
 SliverFillRemaining(
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
    child: Column( //listView listTile (fazer trailing iconButton)
    //observerv listview listbuilder olhar github 
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: TextButton(
            onPressed: () {
             Navigator.pushNamed(context, '/dados_cartao');
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(16.0),
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
                  'Cartão Banco do Brasil',
                 style: TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 69, 72, 73)),
                ),
                SizedBox(height: 8.0),
                Text(
                  '5225 *** **** 5123',
                  style: TextStyle(fontSize: 13.0, color: Colors.grey),
               ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/dados_cartao');
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(16.0),
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
                  'Cartão Banco do Brasil',
                  style: TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 69, 72, 73)),
                ),
                SizedBox(height: 8.0),
                Text(
                  '5225 *** **** 5123',
                  style: TextStyle(fontSize: 13.0, color: Colors.grey),
                 ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/dados_cartao');
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(16.0),
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
                  'Cartão Banco do Brasil',
                  style: TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 69, 72, 73)),
                ),
                SizedBox(height: 8.0),
                Text(
                  '5225 *** **** 5123',
                  style: TextStyle(fontSize: 13.0, color: Colors.grey),
                ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: TextButton(
            onPressed: () {
            Navigator.pushNamed(context, '/dados_cartao');
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(16.0),
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
                  'Cartão Banco do Brasil',
                  style: TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 69, 72, 73)),
                ),
                SizedBox(height: 8.0),
                Text(
                  '5225 *** **** 5123',
                  style: TextStyle(fontSize: 13.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
         Expanded(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
      padding: EdgeInsets.only(bottom: 40.0, right: 20.0),
      child: Container(
        width: 56.0,
        height: 56.0,
         decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 154, 165, 171),
          ),
            child: IconButton(
              color: Colors.white,
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, '/addCard');
              },
            ),
          ),
        ),
      )
         )
      ],
    )
  ),
),]));
}}