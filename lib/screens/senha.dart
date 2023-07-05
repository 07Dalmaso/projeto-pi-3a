import 'package:flutter/material.dart';
import 'package:proj_pi/widgets/customappbar.dart';
import 'package:proj_pi/services/user_service.dart';

class SenhaPage extends StatefulWidget {
  @override
  SenhaPageState createState() => SenhaPageState();
}


class SenhaPageState extends State<SenhaPage> {
  final _form = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  final colors = [
    const Color.fromARGB(255, 69, 72, 73),
    const Color.fromARGB(255, 97, 104, 107),
    const Color.fromARGB(255, 154, 165, 171),
    const Color.fromARGB(255, 246, 247, 248),
  ];

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  

  void _submitForm() {
    if (_form.currentState!.validate()) {
     String email = _emailController.text;
  
    final UserService userService = UserService();

      userService.resetPassword(email);

      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Email de redefinição de senha enviado!'),
      ),
    );
     Navigator.pushNamed(context, '/login');
    }
  }

  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
        ),
        title: Center(child: Text('Alterar senha')),
        elevation: 0,
        toolbarHeight: 80,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email de recuperação',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "E-mail é obrigatório";
                    }
                    if (!value.contains('@')) {
                      return "E-mail inválido";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Alterar Senha'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    minimumSize: Size(1000, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset:
          true, // Permite redimensionar o conteúdo quando o teclado aparecer
    );
  }
}
