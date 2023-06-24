import 'package:flutter/material.dart';
import 'package:proj_pi/services/user_service.dart';
import 'package:proj_pi/widgets/custombutton.dart';
import 'package:proj_pi/widgets/custompasswordfield.dart';
import 'package:proj_pi/widgets/formtextfield.dart';
import 'package:provider/provider.dart';
import '../store/user_store.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _form = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _errorLogin = '';

  bool agree = false;

  UserStore userTeste = UserStore();

  String? _validateNome(String? value) {
    if (value == null || value.isEmpty) {
      return "O nome é obrigatório";
    }
    if (value.length < 3) {
      return "O nome deve ter no mínimo 3 caracteres";
    }
    return null;
  }

  String? _validateCelular(String? value) {
    if (value == null || value.isEmpty) {
      return "O número de celular é obrigatório";
    }
    if (value.length != 11) {
      return "O número de celular deve ter exatamente 11 números";
    }
    return null;
  }

  String? _validateMatricula(String? value) {
    if (value == null || value.isEmpty) {
      return "A matrícula é obrigatória";
    }
    if (value.length != 10) {
      return "A matrícula deve ter exatamente 10 números";
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "E-mail é obrigatório";
    }
    if (!value.contains('@')) {
      return "E-mail inválido";
    }
    return null;
  }

  String? _validateSenha(String? value) {
    if (value == null || value.isEmpty) {
      return "Senha é obrigatória";
    }
    if (value.length < 8) {
      return "Sua senha deve ter no mínimo 8 caracters";
    }
    return null;
  }

  Future<void> _submitForm(BuildContext context) async {
    if (!_form.currentState!.validate()) {
      return;
    }

    setState(() => _errorLogin = '');

    try {
      UserStore userStore = Provider.of<UserStore>(context, listen: false);
      userStore.setName(_nomeController.text);
      userStore.setCPF(_cpfController.text);
      userStore.setEmail(_emailController.text);
      userStore.setPassword(_passwordController.text);

      UserService userService = UserService();

      // Check if the email is already registered
      bool isEmailRegistered =
          await userService.isEmailRegistered(userStore.email);

      if (isEmailRegistered) {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Erro de cadastro'),
              content: const Text('O email fornecido já está registrado.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
        return;
      }

      await userService.saveUser(
        name: userStore.name,
        cpf: userStore.cpf,
        email: userStore.email,
        password: userStore.password,
      );

      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/main');

      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Cadastro bem-sucedido'),
            content: const Text('Seu cadastro foi realizado com sucesso.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      setState(() => _errorLogin = e.toString());
    }
  }

  final colors = [
    const Color.fromARGB(255, 69, 72, 73),
    const Color.fromARGB(255, 97, 104, 107),
    const Color.fromARGB(255, 154, 165, 171),
    const Color.fromARGB(255, 246, 247, 248),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
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
                    Navigator.pushNamed(context, '/login');
                  },
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Adicionar Cartão",
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
        SliverPadding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              Form(
                key: _form,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _errorLogin,
                          style: const TextStyle(
                            height: 2,
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      FormTextField(
                          controller: _nomeController,
                          validator: _validateNome,
                          keyboardType: TextInputType.text,
                          labelText: 'Nome',
                          hintText: 'Nome Completo'),
                      FormTextField(
                          controller: _cpfController,
                          validator: _validateCelular,
                          keyboardType: TextInputType.phone,
                          labelText: 'CPF',
                          hintText: '000.000.000-00'),
                      FormTextField(
                          controller: _emailController,
                          validator: _validateEmail,
                          keyboardType: TextInputType.emailAddress,
                          labelText: 'E-mail',
                          hintText: 'usuario@domínio.com'),
                      PasswordField(
                          controller: _passwordController,
                          validator: _validateSenha,
                          keyboardType: TextInputType.text,
                          labelText: 'Senha',
                          hintText: 'Senha'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomButton(
                          text: 'Cadastrar',
                          onPressed: () => _submitForm(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ])))
      ]),
    );
  }
}
