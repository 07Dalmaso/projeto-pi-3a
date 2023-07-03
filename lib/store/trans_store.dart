import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import '../models/trans_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'trans_store.g.dart'; // Arquivo gerado pelo MobX


class TranStore = _TranStore with _$TranStore;

abstract class _TranStore with Store {
  @observable
  String valor = '';

  @observable
  String data= '';

  @observable
  String descpt= '';

   @observable
  String transId= '';

   @observable
  String cartaoT= '';

  @observable
  ObservableList<TransModel> trans= ObservableList<TransModel>();

  @observable
  ObservableList<String> ids = ObservableList<String>();

    @observable
  ObservableList<String> saldo = ObservableList<String>();
  
  @action
  void setGasto(String value) {
    valor = value;
  }

  @action
  void setDate(String value) {
    data = value;
  }

  @action
  void setDescricao(String value) {
    descpt = value;
  }

   @action
  void setID(String value) {
    transId = value;
  }

   @action
  void setCard(String value) {
    cartaoT = value;
  }

  @computed
  bool get isFormValid =>
      valor.isNotEmpty &&
      data.isNotEmpty &&
      descpt.isNotEmpty;

  @action
void addTrans(TransModel tran) {
  tran.transId = UniqueKey().toString();
  trans.add(tran);
  ids.add(tran.transId);
}

  @action
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void saveTrasaction() {
    // Aqui vocÃª pode implementar a lÃ³gica para salvar o cartÃ£o
    TransModel newTran = TransModel(
      transId: transId,
      valor: valor,
      data: data,
      descpt: descpt,
      cartaoT: cartaoT,
      userId: _auth.currentUser!.uid
    );
    addTrans(newTran);
  }

   @computed
  double get calcularTotal {
    double total = 0.0;
    for (var tran in trans) {
      double valorTransacao = double.tryParse(tran.valor) ?? 0.0;
      total += valorTransacao;
    }
    return total;
  }
}

