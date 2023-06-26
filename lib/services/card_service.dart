import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:proj_pi/models/card_model.dart';

class CardService {
  final DatabaseReference _rootRef = FirebaseDatabase.instance.refFromURL(
      "https://projetoflutterteste-6cd90-default-rtdb.firebaseio.com/");
  late final DatabaseReference _cardRef = _rootRef.child('card');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> saveCard1({
    required String cardNumber,
    required String cardName,
    required String cardHolderName,
    required String expirationDate,
  }) async {
    final newCardRef = _cardRef.push();
    final String? cardId = newCardRef.key;

    await newCardRef.set({
      'cardId': cardId,
      'cardNumber': cardNumber,
      'cardName': cardName,
      'cardHolderName': cardHolderName,
      'expirationDate': expirationDate,
      'userId': _auth.currentUser?.uid
    });
  }

  Future<CardModel?> getUser(String firebaseUserId) async {
    try {
      final DatabaseEvent snapshot = await _cardRef
          .orderByChild('firebaseUserId')
          .equalTo(firebaseUserId)
          .once();
      final cardMap = snapshot.snapshot.value as Map<dynamic, dynamic>?;

      if (cardMap != null) {
        final cardData = cardMap.values.first;

        return CardModel(
            cardId: cardData['cardId'],
            cardHolderName: cardData['cardHolderName'],
            cardName: cardData['cardName'],
            cardNumber: cardData['cardNumber'],
            expirationDate: cardData['expirationDate'],
            userId: _auth.currentUser?.uid);
      }
    } catch (e) {
      // Handle error here
      print('Error getting user data: $e');
    }

    return null;
  }
}
