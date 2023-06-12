import 'package:flutter/material.dart';
//import 'package:proj_pi/cartao.dart';

class DadosCartaoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Color.fromARGB(255, 69, 72, 73)!,
      Color.fromARGB(255, 97, 104, 107)!,
      Color.fromARGB(255, 154, 165, 171)!,
      Color.fromARGB(255, 246, 247, 248)!,
    ];
    return Scaffold(
  body: CustomScrollView(
    shrinkWrap: true,
    slivers: <Widget>[
      SliverAppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        expandedHeight: MediaQuery.of(context).size.height * 0.3,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: colors,
            ),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/cartao');
                },
              ),
              const Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Dados do Cartão",
                    style: TextStyle(
                      color: Color.fromARGB(255, 206, 202, 202),
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        pinned: true,
      ),
  SliverList(
        delegate: SliverChildListDelegate(
          [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
              //spacer(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: TextField(
                      enabled: false,
                      decoration:const InputDecoration(
                        labelText: 'Nome do Titular',
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 69, 72, 73)),
                      controller: TextEditingController(text: 'Sabrina'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: TextField(
                      enabled: false,
                      decoration: const InputDecoration(
                        labelText: 'Nome do Cartão',
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 69, 72, 73)),
                      controller: TextEditingController(text: 'Cartão Banco do Brasil'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: TextField(
                      enabled: false,
                      decoration:const  InputDecoration(
                        labelText: 'Número do Cartão',
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 69, 72, 73)),
                      controller: TextEditingController(text: '5225 *** **** 5123'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: TextField(
                      enabled: false,
                      decoration: const InputDecoration(
                        labelText: 'Data de validade',
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 69, 72, 73)),
                      controller: TextEditingController(text: '06/2023'),
                    ),
                  ),
                   const SizedBox(height: 100.0),
                   Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Expanded(
      child: GestureDetector(
        onTap: () {
          // Lógica para editar o cartão
        },
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              'Editar Cartão',
              style: TextStyle(
                color: Colors.white, fontSize: 15.0,
              ),
            ),
          ),
        ),
      ),
    ),
   const SizedBox(width: 20.0),
    Expanded(
      child: GestureDetector(
        onTap: () {
          // Lógica para excluir o cartão
        },
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              'Excluir Cartão',
              style: TextStyle(
                color: Colors.white, fontSize: 15.0,
              ),
            ),
          ),
        ),
      ),
    ),
  ],
),  //const Spacer(),
          ],
        ),
     
       ),
          ],
        ),
            )
  ]));
  }
}