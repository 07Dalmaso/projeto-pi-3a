// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardStore on _CardStore, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_CardStore.isFormValid'))
          .value;

  late final _$cardNumberAtom =
      Atom(name: '_CardStore.cardNumber', context: context);

  @override
  String get cardNumber {
    _$cardNumberAtom.reportRead();
    return super.cardNumber;
  }

  @override
  set cardNumber(String value) {
    _$cardNumberAtom.reportWrite(value, super.cardNumber, () {
      super.cardNumber = value;
    });
  }

  late final _$cardNameAtom =
      Atom(name: '_CardStore.cardName', context: context);

  @override
  String get cardName {
    _$cardNameAtom.reportRead();
    return super.cardName;
  }

  @override
  set cardName(String value) {
    _$cardNameAtom.reportWrite(value, super.cardName, () {
      super.cardName = value;
    });
  }

  late final _$cardHolderNameAtom =
      Atom(name: '_CardStore.cardHolderName', context: context);

  @override
  String get cardHolderName {
    _$cardHolderNameAtom.reportRead();
    return super.cardHolderName;
  }

  @override
  set cardHolderName(String value) {
    _$cardHolderNameAtom.reportWrite(value, super.cardHolderName, () {
      super.cardHolderName = value;
    });
  }

  late final _$expirationDateAtom =
      Atom(name: '_CardStore.expirationDate', context: context);

  @override
  String get expirationDate {
    _$expirationDateAtom.reportRead();
    return super.expirationDate;
  }

  @override
  set expirationDate(String value) {
    _$expirationDateAtom.reportWrite(value, super.expirationDate, () {
      super.expirationDate = value;
    });
  }

  late final _$cardsAtom = Atom(name: '_CardStore.cards', context: context);

  @override
  ObservableList<CardModel> get cards {
    _$cardsAtom.reportRead();
    return super.cards;
  }

  @override
  set cards(ObservableList<CardModel> value) {
    _$cardsAtom.reportWrite(value, super.cards, () {
      super.cards = value;
    });
  }

  late final _$cardIdsAtom = Atom(name: '_CardStore.cardIds', context: context);

  @override
  ObservableList<String> get cardIds {
    _$cardIdsAtom.reportRead();
    return super.cardIds;
  }

  @override
  set cardIds(ObservableList<String> value) {
    _$cardIdsAtom.reportWrite(value, super.cardIds, () {
      super.cardIds = value;
    });
  }

  late final _$_CardStoreActionController =
      ActionController(name: '_CardStore', context: context);

  @override
  void setCardNumber(String value) {
    final _$actionInfo = _$_CardStoreActionController.startAction(
        name: '_CardStore.setCardNumber');
    try {
      return super.setCardNumber(value);
    } finally {
      _$_CardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCardName(String value) {
    final _$actionInfo = _$_CardStoreActionController.startAction(
        name: '_CardStore.setCardName');
    try {
      return super.setCardName(value);
    } finally {
      _$_CardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCardHolderName(String value) {
    final _$actionInfo = _$_CardStoreActionController.startAction(
        name: '_CardStore.setCardHolderName');
    try {
      return super.setCardHolderName(value);
    } finally {
      _$_CardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExpirationDate(String value) {
    final _$actionInfo = _$_CardStoreActionController.startAction(
        name: '_CardStore.setExpirationDate');
    try {
      return super.setExpirationDate(value);
    } finally {
      _$_CardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCard(CardModel card) {
    final _$actionInfo =
        _$_CardStoreActionController.startAction(name: '_CardStore.addCard');
    try {
      return super.addCard(card);
    } finally {
      _$_CardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCardById(String id) {
    final _$actionInfo = _$_CardStoreActionController.startAction(
        name: '_CardStore.removeCardById');
    try {
      return super.removeCardById(id);
    } finally {
      _$_CardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveCard() {
    final _$actionInfo =
        _$_CardStoreActionController.startAction(name: '_CardStore.saveCard');
    try {
      return super.saveCard();
    } finally {
      _$_CardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cardNumber: ${cardNumber},
cardName: ${cardName},
cardHolderName: ${cardHolderName},
expirationDate: ${expirationDate},
cards: ${cards},
cardIds: ${cardIds},
isFormValid: ${isFormValid}
    ''';
  }
}
