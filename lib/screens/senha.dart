import 'package:flutter/material.dart';
import 'package:proj_pi/widgets/customappbar.dart';

class SenhaPage extends StatefulWidget {
  @override
  SenhaPageState createState() => SenhaPageState();
}

class SenhaPageState extends State<SenhaPage> {
  final _form = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final colors = [
    const Color.fromARGB(255, 69, 72, 73),
    const Color.fromARGB(255, 97, 104, 107),
    const Color.fromARGB(255, 154, 165, 171),
    const Color.fromARGB(255, 246, 247, 248),
  ];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_form.currentState!.validate()) {
      // Realize a alteração de senha aqui
      // Use _emailController.text e _passwordController.text para obter os valores digitados
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Alterar senha'),
      body: SingleChildScrollView(
        // Envolve o conteúdo com SingleChildScrollView
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
                    labelText: 'Email',
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
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Nova Senha',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Senha é obrigatória";
                    }
                    if (value.length < 8) {
                      return "Sua senha deve ter no mínimo 8 caracters";
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
