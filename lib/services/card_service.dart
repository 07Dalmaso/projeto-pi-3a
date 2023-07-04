import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
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

  /*Future<CardModel?> getCard(String firebaseUserId) async {
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
  }*/
  Future<List<dynamic>> getCardByUser() async {
    try {
      final User? currentUser = _auth.currentUser;

      final String userKey = currentUser?.uid ?? '';

      final DatabaseEvent snapshot =
          await _cardRef.orderByChild('userId').equalTo(userKey).once();

      final Map<dynamic, dynamic>? cardData =
          (snapshot.snapshot.value as Map<dynamic, dynamic>?);
      final List<dynamic> cards = cardData?.values.toList() ?? [];

       print(cards);
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
Future<void> updateCard(String cardId, {
  String? cardNumber,
  String? cardName,
  String? cardHolderName,
  String? expirationDate, 
}) async {
  try {
    final cardRef = _cardRef.child(cardId);

    final DatabaseEvent snapshot = await cardRef.once();
    final cardData = snapshot.snapshot.value;

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
    } else {
      print('Card not found');
    }
  } catch (e) {
    print('Error updating card: $e');
    // Handle error here
  }
}

}

