import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'card_model.dart';
part 'card_store.g.dart'; // Arquivo gerado pelo MobX

class CardStore = _CardStore with _$CardStore;

abstract class _CardStore with Store {
  @observable
  String cardNumber = '';

  @observable
  String cardName = '';

  @observable
  String cardHolderName = '';

  @observable
  String expirationDate = '';

  @observable
  ObservableList<CardModel> cards = ObservableList<CardModel>();

  @observable
  ObservableList<String> cardIds = ObservableList<String>();

  @action
  void setCardNumber(String value) {
    cardNumber = value;
  }

  @action
  void setCardName(String value) {
    cardName = value;
  }

  @action
  void setCardHolderName(String value) {
    cardHolderName = value;
  }

  @action
  void setExpirationDate(String value) {
    expirationDate = value;
  }

  @computed
  bool get isFormValid =>
      cardNumber.isNotEmpty &&
      cardName.isNotEmpty &&
      cardHolderName.isNotEmpty &&
      expirationDate.isNotEmpty;

  @action
void addCard(CardModel card) {
  card.id = UniqueKey().toString();
  cards.add(card);
  cardIds.add(card.id);
}

 @action
  void removeCardById(String id) {
  cards.removeWhere((card) => card.id == id);
  cardIds.remove(id);
}
  @action
  void saveCard() {
    // Aqui você pode implementar a lógica para salvar o cartão
    CardModel newCard = CardModel(
      id: UniqueKey().toString(),
      cardNumber: cardNumber,
      cardName: cardName,
      cardHolderName: cardHolderName,
      expirationDate: expirationDate,
    );
    addCard(newCard);
  }
}
