import 'package:flutter/material.dart';
import 'package:proj_pi/services/card_service.dart';

class CartaoPage extends StatefulWidget {
  const CartaoPage({super.key});

  @override
  _CartaoPageState createState() => _CartaoPageState();
}

class _CartaoPageState extends State<CartaoPage>{

  List<String> cardNamesList = [];
  List<String> cardIdList = [];
  List<String> cardNumberList = [];

  @override
  void initState() {
    super.initState();
    pegarCardUser();
  }

  void pegarCardUser () async{
    CardService cardService=CardService();
    var cardData =await cardService.getCardByUser();
     List<String> cardNames = [];
     List<String> cardIds = [];
     List<String> cardNumbers = [];

  for (var card in cardData) {
    String cardName = card['cardName'];
    String cardId = card['cardId'];
    String cardNumber = card['cardNumber'];
    cardNames.add(cardName);
    cardIds.add(cardId);
    cardNumbers.add(cardNumber);
  }

  setState(() {
    cardNamesList = cardNames;
    cardIdList = cardIds;
    cardNumberList = cardNumbers;

  });
}

  @override
  Widget build(BuildContext context) {

    print(cardNamesList);
    List<Color> colors = [
      Color.fromARGB(255, 69, 72, 73),
      Color.fromARGB(255, 97, 104, 107),
      Color.fromARGB(255, 154, 165, 171),
      Color.fromARGB(255, 246, 247, 248),
    ];

    double appBarHeight = MediaQuery.of(context).size.height * 0.25;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            expandedHeight: appBarHeight,
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
                  const Expanded(
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                String cardNamee=cardNamesList[index];
                String cardID=cardIdList[index];
                String cardNumberr=cardNumberList[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/dados_cartao',
                          arguments: cardID);
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
                            cardNamee,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 69, 72, 73),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '**** **** **** '+ cardNumberr,
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
              childCount: cardNamesList.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 154, 165, 171),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/addCard');
        },
      ),
    );
  }
}
