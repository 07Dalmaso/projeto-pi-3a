class TransModel {
  String valor;
  String data;
  String transId;
   String transCardId;
  String ?descpt;

  TransModel({
   required this.valor,
    required this.data,
    required this.transId,
    required this.transCardId,
    this.descpt,
  });
}