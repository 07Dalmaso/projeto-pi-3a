import 'package:firebase_database/firebase_database.dart';
import 'package:proj_pi/models/trans_model.dart';

class GastosService {
  final DatabaseReference _rootRef = FirebaseDatabase.instance.refFromURL(
      "https://projetoflutterteste-6cd90-default-rtdb.firebaseio.com/");
  late final DatabaseReference _gastosRef = _rootRef.child('gastos');

  Future<void> saveGastos1({
    required String valor,
    required String data,
    required String descpt,
    required String transId,
    required String cartaoT,
  }) async {
    final newGastosRef = _gastosRef.push();
    await newGastosRef.set({
      'valor': valor,
      'data': data,
      'descpt': descpt,
      'transId': transId,
      'cartaoT': cartaoT,
    });
  }
}
