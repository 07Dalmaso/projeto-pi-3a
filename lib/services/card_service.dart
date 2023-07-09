import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

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
    required String cardId,
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

  Future<List<dynamic>> getCardByUser() async {
    try {
      final User? currentUser = _auth.currentUser;

      final String userKey = currentUser?.uid ?? '';

      final DatabaseEvent snapshot =
          await _cardRef.orderByChild('userId').equalTo(userKey).once();

      final Map<dynamic, dynamic>? cardData =
          (snapshot.snapshot.value as Map<dynamic, dynamic>?);
      final List<dynamic> cards = cardData?.values.toList() ?? [];

      //print(cards);
      return cards;
    } catch (e) {
      // Handle the data reading error here
      print('Error retrieving cards data: $e');
      return [];
    }
  }
  Future<dynamic> getCardById(String cardId) async {
  try {
    final DatabaseEvent snapshot =
        await _cardRef.child(cardId).once();

    final dynamic cardData = snapshot.snapshot.value;

    if (cardData != null) {
      print(cardData);
      return cardData;
    } else {
      print('Card not found');
      return null;
    }
  } catch (e) {
    // Handle the data reading error here
    print('Error retrieving card data: $e');
    return null;
  }
}

Future<void> deleteCardById(String cardId) async {
  try {
    await _cardRef.child(cardId).remove();
    print('Card deleted successfully');
  } catch (e) {
    print('Error deleting card: $e');
    // Trate o erro de exclusão do cartão aqui
  }
}
  List<dynamic> cards = []; // Initialize the cards list

  void updateCardList() {
    cards = List<dynamic>.from(cards); // Make a copy of the cards list
  }

  Future<void> updateCard(String cardId, {
    String? cardNumber,
    String? cardName,
    String? cardHolderName,
    String? expirationDate,
  }) async {
    try {
      final cardRef = _cardRef.child(cardId);

      final snapshot = await cardRef.once();
       final cardData = snapshot.snapshot.value as Map<dynamic, dynamic>;

      if (cardData != null) {
        final updatedCardData = <String, dynamic>{};

        if (cardNumber != null) {
          updatedCardData['cardNumber'] = cardNumber;
        }
        if (cardName != null) {
          updatedCardData['cardName'] = cardName;
        }
        if (cardHolderName != null) {
          updatedCardData['cardHolderName'] = cardHolderName;
        }
        if (expirationDate != null) {
          updatedCardData['expirationDate'] = expirationDate;
        }

        await cardRef.update(updatedCardData);

        print('Card updated successfully');
        
        // Update the card in the local list if found
        int cardIndex = cards.indexWhere((card) => card['id'] == cardId);
        if (cardIndex != -1) {
          cards[cardIndex] = updatedCardData;
        }
      } else {
        print('Card not found');
      }
    } catch (e) {
      print('Error updating card: $e');
      // Handle error here
    }
  }
}

