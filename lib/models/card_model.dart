import 'package:flutter/foundation.dart';

class CardModel with Diagnosticable {
  String cardId;
  String cardNumber;
  String cardName;
  String cardHolderName;
  String expirationDate;
  String? userId;

  CardModel({
    required this.cardId,
    required this.cardNumber,
    required this.cardName,
    required this.cardHolderName,
    required this.expirationDate,
    required this.userId,
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
