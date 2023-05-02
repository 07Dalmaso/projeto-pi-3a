
import 'package:flutter/material.dart';
//import 'package:proj_pi/main.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            color: Colors.white,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Seu Saldo: "),
              Text("R\$150,00"),
            ],
          )
        ],
      ),
    );
  }
}
