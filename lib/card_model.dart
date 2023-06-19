import 'package:flutter/foundation.dart';

class CardModel with Diagnosticable{
        String cardId;
  final String cardNumber;
  final String cardName;
  final String cardHolderName;
  final String expirationDate;

  CardModel({
    required this.cardId,
    required this.cardNumber,
    required this.cardName,
    required this.cardHolderName,
    required this.expirationDate,
  });

   @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('id', cardId));
    properties.add(StringProperty('cardNumber', cardNumber));
    properties.add(StringProperty('cardName', cardName));
    properties.add(StringProperty('cardHolderName', cardHolderName));
    properties.add(StringProperty('expirationDate', expirationDate));
  }
}