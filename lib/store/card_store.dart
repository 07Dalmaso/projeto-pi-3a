import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import '../models/card_model.dart';
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
  String cardId = '';

  @observable
  ObservableList<CardModel> cards = ObservableList<CardModel>();

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
    card.cardId = UniqueKey().toString();
    cards.add(card);
  }

  @action
  CardModel? getCardById(String cardId) {
    return cards.firstWhere((card) => card.cardId == cardId);
  }

  @action
  void removeCardById(CardModel cardToRemove) {
    cards.removeWhere((card) => card.cardId == cardToRemove.cardId);
  }

  @action
  void printAllCards() {
    print('Cartões Salvos:');
    for (var card in cards) {
      print('Número do Cartão: ${card.cardNumber}');
      print('Nome do Cartão: ${card.cardName}');
      print('Nome do Titular: ${card.cardHolderName}');
      print('Data de Validade: ${card.expirationDate}');
      print('id do cartao: ${card.cardId}');
    }
  }

  @action
  void saveCard() {
    // Aqui você pode implementar a lógica para salvar o cartão
    CardModel newCard = CardModel(
      cardId: cardId,
      cardNumber: cardNumber,
      cardName: cardName,
      cardHolderName: cardHolderName,
      expirationDate: expirationDate,
    );
    addCard(newCard);
    printAllCards();
  }
}
