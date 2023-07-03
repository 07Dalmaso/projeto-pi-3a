class TransModel {
  String valor;
  String data;
  String transId;
   String cartaoT;
  String  descpt;
   String? userId;

  TransModel({
  required this.userId,
   required this.valor,
    required this.data,
    required this.transId,
    required this.cartaoT,
    required this.descpt,
  });
}