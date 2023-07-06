import 'package:flutter/material.dart';
import 'package:proj_pi/services/user_service.dart';
import 'package:proj_pi/widgets/custombutton.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _form = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false; // Track password visibility
  bool _isLoading = false;
  String _errorLogin = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      _isLoading = false;
      return "Senha é obrigatória";
    }
    if (value.length < 8) {
      _isLoading = false;
      return "Sua senha deve ter no mínimo 8 caracteres";
    }
    return null;
  }

  Future<void> _submitForm(BuildContext context) async {
    if (!_form.currentState!.validate()) {
      return;
    }

    String email = _emailController.text;
    String password = _passwordController.text;

    UserService userService = UserService();

    try {
      await userService.loginUser(email: email, password: password);
      Navigator.of(context).pushReplacementNamed('/main');
    } catch (e) {
      setState(() {
        _errorLogin =
            'Ocorreu um erro de autenticação. Verifique seu e-mail e senha.';
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro de Autenticação'),
            content: Text(_errorLogin),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    controller: _emailController,
                    validator: _validateEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email),
                      labelText: 'E-mail',
                    ),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    controller: _passwordController,
                    validator: _validatePassword,
                    obscureText:
                        !_isPasswordVisible, // Obfuscate the password if not visible
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Senha',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: CustomButton(
                text: 'Login',
                onPressed: () => {
                      setState(() {
                        _isLoading = true;
                      }),
                      _submitForm(context),
                    }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Row(
              // Envolve os botões em um widget Row
              mainAxisAlignment:
                  MainAxisAlignment.center, // Alinha os elementos à esquerda
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/cadastro');
                  },
                  style: ElevatedButton.styleFrom(),
                  child: const Text(
                    'Inscreva-se',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/senha');
                  },
                  style: ElevatedButton.styleFrom(),
                  child: const Text(
                    'Esqueci a senha',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_isLoading)
            Container(
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
