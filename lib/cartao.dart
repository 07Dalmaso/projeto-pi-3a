
import 'package:flutter/material.dart';

class CartaoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Color.fromARGB(255, 69, 72, 73)!,
      Color.fromARGB(255, 97, 104, 107)!,
      Color.fromARGB(255, 154, 165, 171)!,
      Color.fromARGB(255, 246, 247, 248)!,
    ];
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: colors,
              ),
            ),
            child: Center(
              child: Text(
                "Meus Cartões",
                style: TextStyle(
                  color: Color.fromARGB(255, 206, 202, 202),
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 206, 202, 202),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 14),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16.0),
                            hintText: "Cartão 1",
                            hintStyle: TextStyle(fontSize: 16.0),
                          ),
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      SizedBox(width: 14),
                      Container(                                                                                
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // ação ao pressionar o botão de editar
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14.0),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 206, 202, 202),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16.0),
                      hintText: "Cartão 2",
                      hintStyle: TextStyle(fontSize: 16.0),
                    ),
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                SizedBox(height: 14.0),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 206, 202, 202),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16.0),
                      hintText: "Cartao 3",
                      hintStyle: TextStyle(fontSize: 16.0),
                    ),
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                SizedBox(height: 14.0),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 206, 202, 202),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16.0),
                      hintText: "Cartão 4",
                      hintStyle: TextStyle(fontSize: 16.0),
                    ),
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0, left:22.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/main');
              },
              icon: Icon(Icons.arrow_back),
              label: Text('Voltar'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 215, 207, 206)),
            ),
          ),
     ),
             /* SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 70, 210, 35)),
                  fixedSize: MaterialStateProperty.all<Size>(Size(100, 50)),
                ),
                child: Text("Confirmar"),
              ),*/
            ],
          ),
          //SizedBox(height: 20.0),
      );
  }
}
