import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'common/extensions/colors.dart';
import 'common/extensions/sizes.dart';
import 'constants/text_strings.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamed(
                    context, '/profile'); // Navegar de volta à página anterior
              },
            ),
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: colors,
                ),
              ),
              child: Center(
                child: Text(
                  "Alterar Perfil",
                  style: TextStyle(
                    color: Color.fromARGB(255, 206, 202, 202),
                    fontSize: 25.0,
                  ),
                ),
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
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              label: Text('Nome'),
                              prefixIcon: Icon(LineAwesomeIcons.user)),
                        ),
                        const SizedBox(height: tFormHeight - 20),
                        TextFormField(
                          decoration: const InputDecoration(
                              label: Text('Email'),
                              prefixIcon: Icon(LineAwesomeIcons.envelope_1)),
                        ),
                        const SizedBox(height: tFormHeight - 20),
                        TextFormField(
                          decoration: const InputDecoration(
                              label: Text('CPF'),
                              prefixIcon: Icon(Icons.perm_identity)),
                        ),
                        const SizedBox(height: tFormHeight - 20),

                        // -- Form Submit Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/profile');
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: tPrimaryColor,
                                side: BorderSide.none,
                                shape: const StadiumBorder()),
                            child: const Text(tEditProfile,
                                style: TextStyle(color: tDarkColor)),
                          ),
                        ),
                        const SizedBox(height: tFormHeight),
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
