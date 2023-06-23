import 'package:flutter/material.dart';
//import './common/extensions/CustomInputField.dart';
import 'package:provider/provider.dart';
import 'card_store.dart';
import 'card_model.dart';

class EditCard extends StatefulWidget {

  final String cardId;

  EditCard({required this.cardId});

  @override
  _EditState createState() => _EditState();
}

  class _EditState extends State<EditCard> {
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cardStore = Provider.of<CardStore>(context);
    final CardModel? card = cardStore.getCardById(widget.cardId);

    final colors = [
      const Color.fromARGB(255, 69, 72, 73),
      const Color.fromARGB(255, 97, 104, 107),
      const Color.fromARGB(255, 154, 165, 171),
      const Color.fromARGB(255, 246, 247, 248),
    ];
     return Scaffold(
  body: CustomScrollView(
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
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/dados_cartao');
                },
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Editar Cartão",
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
  padding: const EdgeInsets.all(16.0),
  child: Form(
    key: _formKey,
    child: Column(
      children: [
         TextFormField(
          decoration: InputDecoration(
            labelText: 'Nome do Titular',
            hintText: card?.cardHolderName, 
            border: OutlineInputBorder(),
          ),
          style: TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 69, 72, 73)),
          //initialValue: cardStore.cardHolderName,
          onChanged:  (value) => cardStore.setCardHolderName(value),
          validator: (value) {
            if (value!.isEmpty) {
              cardStore.setCardHolderName(card?.cardHolderName ?? '');
            }
            return null;
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.023),
        TextFormField(
          decoration: InputDecoration(
            labelText:'Apelido do Cartão', 
            hintText: card?.cardName,
            border: OutlineInputBorder(),
          ),
          style: TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 69, 72, 73)),
          //initialValue: cardStore.cardName,
          onChanged:  (value) => cardStore.setCardName(value),
          validator: (value) {
            if (value!.isEmpty) {
               cardStore.setCardName(card?.cardName ?? '');
            }
            return null;
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.023),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Últimos 4 dígitos do cartão',
            hintText: card?.cardNumber,
            border: OutlineInputBorder(),
          ),
          style: const TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 69, 72, 73)),
          //initialValue: cardStore.cardNumber,
          onChanged:  (value) => cardStore.setCardNumber(value),
          validator: (value) {
            if (value!.isEmpty) {
              cardStore.setCardNumber(card?.cardNumber ?? '');
            }
            else {
              if (value.length > 4) {
              return 'Insira apenas os 4 últimos dígitos';
            }
            if(value.length<4){
               return 'Insira os 4 últimos dígitos';
            }

  return null;
}
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.023),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Data de Vencimento',
            hintText: card?.expirationDate,
            border: OutlineInputBorder(),
          ),
          style: TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 69, 72, 73)),
          //initialValue: cardStore.expirationDate,
          onChanged:  (value) => cardStore.setExpirationDate(value),
          validator: (value) {
            if (value!.isEmpty) {
               cardStore.setExpirationDate(card?.expirationDate ?? '');
            }else {
    // Regular expression pattern for "mm/yyyy" format
    final pattern = r'^\d{2}/\d{2}$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Insira a data no formato mês/ano';
    }
  }
         return null;
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.023),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (cardStore.isFormValid) {
                    cardStore.updateCard( widget.cardId );
                    _formKey.currentState!.reset();

                    Navigator.pushNamed(context, '/dados_cartao', arguments: widget.cardId);
                  }
                }
              },
              child: Text('Salvar'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.green,
                ),
                fixedSize: MaterialStateProperty.all<Size>(
                  Size(
                    MediaQuery.of(context).size.width * 0.4,
                    MediaQuery.of(context).size.height * 0.07,
                  ),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ),
)])
                 )
    ]
     ));
  }}