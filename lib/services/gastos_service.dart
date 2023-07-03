import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:proj_pi/models/trans_model.dart';

class GastosService {
  final DatabaseReference _rootRef = FirebaseDatabase.instance.refFromURL(
      "https://projetoflutterteste-6cd90-default-rtdb.firebaseio.com/");
  late final DatabaseReference _gastosRef = _rootRef.child('gastos');
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
      'userId': _auth.currentUser?.uid
    });
  }

  Future<TransModel?> getGasto(String firebaseUserId) async {
    try {
      final DatabaseEvent snapshot = await _gastosRef
          .orderByChild('firebaseUserId')
          .equalTo(firebaseUserId)
          .once();
      final tranMap = snapshot.snapshot.value as Map<dynamic, dynamic>?;

      if (tranMap != null) {
        final transData = tranMap.values.first;

        return TransModel(
            transId: transData['transId'],
            valor: transData['valor'],
            data: transData['data'],
            descpt: transData['descpt'],
            cartaoT: transData['cartaoT'],
            userId: _auth.currentUser?.uid);
      }
    } catch (e) {
      // Handle error here
      print('Error getting user data: $e');
    }

    return null;
  }

   Future<List<dynamic>> getGastoByUser() async {
    try {
      final User? currentUser = _auth.currentUser;

      final String userKey = currentUser?.uid ?? '';

      final DatabaseEvent snapshot =
          await _gastosRef.orderByChild('userId').equalTo(userKey).once();

      final Map<dynamic, dynamic>? transData =
          (snapshot.snapshot.value as Map<dynamic, dynamic>?);
      final List<dynamic> gastos = transData?.values.toList() ?? [];

       print(gastos);
      return gastos;
    } catch (e) {
      // Handle the data reading error here
      print('Error retrieving transactions data: $e');
      return [];
    }
  }
  Future<dynamic> getGatosById(String transId) async {
  try {
    final DatabaseEvent snapshot =
        await _gastosRef.child(transId).once();

    final dynamic transData = snapshot.snapshot.value;

    if (transData != null) {
      print(transData);
      return transData;
    } else {
      print('Transaction not found');
      return null;
    }
  } catch (e) {
    // Handle the data reading error here
    print('Error retrieving transaction data: $e');
    return null;
  }
}
 Future<double> sumValues() async {
  double total = 0.0;

  List<dynamic> transData = await getGastoByUser();

  for (var gasto in transData) {
    String transValor = gasto['valor'];
    double value = double.tryParse(transValor) ?? 0.0;
    total += value;
  }

  return total;
}

}
