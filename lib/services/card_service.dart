import 'package:firebase_database/firebase_database.dart';

class CardService {
  final DatabaseReference _rootRef = FirebaseDatabase.instance.refFromURL(
      "https://projetoflutterteste-6cd90-default-rtdb.firebaseio.com/");
  late final DatabaseReference _cardRef = _rootRef.child('card');

  Future<void> saveCard1({
    required String cardNumber,
    required String cardName,
    required String cardHolderName,
    required String expirationDate,
  }) async {
    final newCardRef = _cardRef.push();
    await newCardRef.set({
        'cardNumber' :  cardNumber,
        'cardName' : cardName,
        'cardHolderName' : cardHolderName,
        'expirationDate' : expirationDate, 
    });
  }
}
