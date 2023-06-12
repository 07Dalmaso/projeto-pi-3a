import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';
import 'package:proj_pi/user_store.dart';
import 'package:proj_pi/user_model.dart';


class CadastroPage extends StatefulWidget {
  @override
  CadastroPageState createState() => CadastroPageState();
}

class CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _nameController = TextEditingController();
  final _cpfController = TextEditingController();


  String _errorCadastro = '';

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    _nameController.dispose();
    _cpfController.dispose();
    super.dispose();
  }
   String? _validateNome(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nome é obrigatório';
    }
    return null;
   }

     String? _validateCPF(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email é obrigatório';
    }
    return null;
     }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email é obrigatório';
    }

    if (!EmailValidator.validate(value)) {
      return 'Email inválido';
    }

    return null;
  }

  String? _validateSenha(String? value) {
    if (value == null || value.isEmpty) {
      return 'Senha é obrigatória';
    }

    if (value.length < 6) {
      return 'Senha deve ter no mínimo 6 caracteres';
    }

    return null;
  }

  Future<void> _submitForm(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _errorCadastro = '');

    try {
      UserStore userStore = Provider.of<UserStore>(context, listen: false);
    
      userStore.setEmail(_emailController.text);
      userStore.setPassword(_senhaController.text);
      userStore.setName(_nameController.text);
      userStore.setCPF(_cpfController.text);

      UserModel newUser = UserModel(
      email: _emailController.text,
      password: _senhaController.text,
      name: _nameController.text,
      cpf: _cpfController.text,
    );

    userStore.addRegisteredUser(newUser);
      
      Navigator.pushReplacementNamed(context, '/main');
    } catch (e) {
      setState(() => _errorCadastro = e.toString());
    }
  }

 
  @override
  Widget build(BuildContext context) {
  UserStore userStore = Provider.of<UserStore>(context);
  UserModel? loggedInUser = userStore.loggedInUser;

  List<Color> colors = [
    Color.fromARGB(255, 69, 72, 73),
    Color.fromARGB(255, 97, 104, 107),
    Color.fromARGB(255, 154, 165, 171),
    Color.fromARGB(255, 246, 247, 248),
  ];

  return Scaffold(
  appBar: null,
  body: Consumer<UserStore>(
    builder: (context, userStore, _) {

      return CustomScrollView(
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
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Cadastro",
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
            padding: EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(height: 16.0),
                        TextFormField(
                          controller: _nameController,
                          validator: _validateNome,
                          decoration: InputDecoration(
                            labelText: 'Nome',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          controller: _cpfController,
                          validator: _validateCPF,
                          decoration: InputDecoration(
                            labelText: 'CPF',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          controller: _emailController,
                          validator: _validateEmail,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          controller: _senhaController,
                          validator: _validateSenha,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 90.0),
                        ElevatedButton(
                          onPressed: () => _submitForm(context),
                          child: Text('Cadastrar'),
                          style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          minimumSize: Size(150, 60),
                          shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10), 
                         ),
                         )
                        ),
                        Text(
                          _errorCadastro,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  ),
);
}
}