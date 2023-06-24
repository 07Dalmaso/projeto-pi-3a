// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trans_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TranStore on _TranStore, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_TranStore.isFormValid'))
          .value;
  Computed<double>? _$calcularTotalComputed;

  @override
  double get calcularTotal =>
      (_$calcularTotalComputed ??= Computed<double>(() => super.calcularTotal,
              name: '_TranStore.calcularTotal'))
          .value;

  late final _$valorAtom = Atom(name: '_TranStore.valor', context: context);

  @override
  String get valor {
    _$valorAtom.reportRead();
    return super.valor;
  }

  @override
  set valor(String value) {
    _$valorAtom.reportWrite(value, super.valor, () {
      super.valor = value;
    });
  }

  late final _$dataAtom = Atom(name: '_TranStore.data', context: context);

  @override
  String get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(String value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$descptAtom = Atom(name: '_TranStore.descpt', context: context);

  @override
  String get descpt {
    _$descptAtom.reportRead();
    return super.descpt;
  }

  @override
  set descpt(String value) {
    _$descptAtom.reportWrite(value, super.descpt, () {
      super.descpt = value;
    });
  }

  late final _$transIdAtom = Atom(name: '_TranStore.transId', context: context);

  @override
  String get transId {
    _$transIdAtom.reportRead();
    return super.transId;
  }

  @override
  set transId(String value) {
    _$transIdAtom.reportWrite(value, super.transId, () {
      super.transId = value;
    });
  }

  late final _$cartaoTAtom = Atom(name: '_TranStore.cartaoT', context: context);

  @override
  String get cartaoT {
    _$cartaoTAtom.reportRead();
    return super.cartaoT;
  }

  @override
  set cartaoT(String value) {
    _$cartaoTAtom.reportWrite(value, super.cartaoT, () {
      super.cartaoT = value;
    });
  }

  late final _$transAtom = Atom(name: '_TranStore.trans', context: context);

  @override
  ObservableList<TransModel> get trans {
    _$transAtom.reportRead();
    return super.trans;
  }

  @override
  set trans(ObservableList<TransModel> value) {
    _$transAtom.reportWrite(value, super.trans, () {
      super.trans = value;
    });
  }

  late final _$idsAtom = Atom(name: '_TranStore.ids', context: context);

  @override
  ObservableList<String> get ids {
    _$idsAtom.reportRead();
    return super.ids;
  }

  @override
  set ids(ObservableList<String> value) {
    _$idsAtom.reportWrite(value, super.ids, () {
      super.ids = value;
    });
  }

  late final _$saldoAtom = Atom(name: '_TranStore.saldo', context: context);

  @override
  ObservableList<String> get saldo {
    _$saldoAtom.reportRead();
    return super.saldo;
  }

  @override
  set saldo(ObservableList<String> value) {
    _$saldoAtom.reportWrite(value, super.saldo, () {
      super.saldo = value;
    });
  }

  late final _$_TranStoreActionController =
      ActionController(name: '_TranStore', context: context);

  @override
  void setGasto(String value) {
    final _$actionInfo =
        _$_TranStoreActionController.startAction(name: '_TranStore.setGasto');
    try {
      return super.setGasto(value);
    } finally {
      _$_TranStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(String value) {
    final _$actionInfo =
        _$_TranStoreActionController.startAction(name: '_TranStore.setDate');
    try {
      return super.setDate(value);
    } finally {
      _$_TranStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescricao(String value) {
    final _$actionInfo = _$_TranStoreActionController.startAction(
        name: '_TranStore.setDescricao');
    try {
      return super.setDescricao(value);
    } finally {
      _$_TranStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setID(String value) {
    final _$actionInfo =
        _$_TranStoreActionController.startAction(name: '_TranStore.setID');
    try {
      return super.setID(value);
    } finally {
      _$_TranStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCard(String value) {
    final _$actionInfo =
        _$_TranStoreActionController.startAction(name: '_TranStore.setCard');
    try {
      return super.setCard(value);
    } finally {
      _$_TranStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTrans(TransModel tran) {
    final _$actionInfo =
        _$_TranStoreActionController.startAction(name: '_TranStore.addTrans');
    try {
      return super.addTrans(tran);
    } finally {
      _$_TranStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveTrasaction() {
    final _$actionInfo = _$_TranStoreActionController.startAction(
        name: '_TranStore.saveTrasaction');
    try {
      return super.saveTrasaction();
    } finally {
      _$_TranStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valor: ${valor},
data: ${data},
descpt: ${descpt},
transId: ${transId},
cartaoT: ${cartaoT},
trans: ${trans},
ids: ${ids},
saldo: ${saldo},
isFormValid: ${isFormValid},
calcularTotal: ${calcularTotal}
    ''';
  }
}
