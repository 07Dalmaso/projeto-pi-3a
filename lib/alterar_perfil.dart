import 'package:flutter/material.dart';
import 'package:proj_pi/user_model.dart';
import 'package:proj_pi/user_store.dart';
import 'package:provider/provider.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserStore userStore = Provider.of<UserStore>(context);
    //final List<UserModel> registeredUsers = userStore.registeredUsers;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    List<Color> colors = [
      Color.fromRGBO(69, 72, 73, 1),
      Color.fromARGB(255, 97, 104, 107),
      Color.fromARGB(255, 154, 165, 171),
      Color.fromARGB(255, 246, 247, 248),
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
                      Navigator.pushNamed(context, '/profile');
                    },
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Alterar Perfil",
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
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/image.jpg'),
                      backgroundColor: Color.fromARGB(255, 78, 74, 84),
                    ),
                  ),
                  SizedBox(height: 16),

                  // -- Form Fields
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Nome',
                            prefixIcon: Icon(Icons.person),
                          ),
                          onChanged: (value) {
                            // Atualizar o campo 'name' do objeto UserModel
                            userStore.setName(value);
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                          ),
                          onChanged: (value) {
                            // Atualizar o campo 'email' do objeto UserModel
                            userStore.setEmail(value);
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'CPF',
                            prefixIcon: Icon(Icons.perm_identity),
                          ),
                          onChanged: (value) {
                            // Atualizar o campo 'email' do objeto UserModel
                            userStore.setCPF(value);
                          },
                        ),
                        const SizedBox(height: 20),

                        // -- Form Submit Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (userStore.isFormValid) {
                                  
                                  userStore.saveUser();
                                  _formKey.currentState!.reset();
                                  Navigator.pushReplacementNamed(
                                      context, '/profile');
                                }
                              }
                              // Chamar o método updateUserProfile passando o objeto UserModel com os dados atualizados
                              userStore.updateUserProfile(UserModel(
                                name: userStore.name,
                                email: userStore.email,
                                cpf: userStore.cpf,
                                userId: '',
                                password: '',
                              ));

                              Navigator.pushNamed(context, '/profile');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              side: BorderSide.none,
                              shape: const StadiumBorder(),
                            ),
                            child: const Text(
                              'Salvar Perfil',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
