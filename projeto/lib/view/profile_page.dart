import 'package:flutter/material.dart';
import 'package:projeto/view/login_page.dart';

import '../components/custom_button_widget.dart';

import '../components/profile_text_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = false;

  late final String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 25.0,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Center(
          child: Text('Perfil', style: TextStyle(fontSize: 25)),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Salvar',
              style: TextStyle(
                color: Colors.transparent,
                shadows: [Shadow(color: Colors.white, offset: Offset(0, -3))],
                decorationColor: Colors.white,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 59, 19, 150),
      ),
      backgroundColor: const Color(0xffE3F2FD),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Dados',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(thickness: 1.5, color: Colors.black),
            const ProfileTextFieldWiget(
              labelText: 'Nome',
              placeholder: 'Meu nome',
            ),
            const ProfileTextFieldWiget(
              labelText: 'Código',
              placeholder: '123456',
            ),
            const ProfileTextFieldWiget(
              labelText: 'Turma',
              placeholder: '2023/01',
            ),
            const SizedBox(height: 25),
            const Center(
              child: Text(
                'Senha',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(thickness: 1.5, color: Colors.black),
            const ProfileTextFieldWiget(
              labelText: 'Nova Senha',
              placeholder: '*************',
              isPassword: true,
            ),
            const SizedBox(height: 110),
            CustomButtonWidget(
              label: 'Sair',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              icon: Icons.logout,
              isLoading: isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
