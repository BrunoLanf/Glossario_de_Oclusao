import 'package:flutter/material.dart';
import 'package:projeto/database/database_manager.dart';
import 'package:projeto/services/auth_service.dart';
import 'package:projeto/view/login_page.dart';
import 'package:provider/provider.dart';

import '../components/custom_button_widget.dart';

import '../components/profile_text_field.dart';
import '../model/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController codcontroller = TextEditingController();
  TextEditingController turmacontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool isLoading = false;

  late final String userid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dadosUsuario();
  }

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
            onPressed: salvar,
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
            ProfileTextFieldWiget(
              controller: namecontroller,
              labelText: 'Nome',
              placeholder: 'Meu nome',
            ),
            ProfileTextFieldWiget(
              controller: codcontroller,
              labelText: 'Código',
              placeholder: '123456',
            ),
            ProfileTextFieldWiget(
              controller: turmacontroller,
              labelText: 'Turma',
              placeholder: '2023/01',
            ),
            const SizedBox(height: 140),
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

  salvar() async {
    if (namecontroller.text.isEmpty ||
        codcontroller.text.isEmpty ||
        turmacontroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Os campos precisam estar preenchidos",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xffE3F2FD),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 59, 19, 150),
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      await DataBaseManager.setUser(
              userid,
              User(namecontroller.text, codcontroller.text,
                  turmacontroller.text))
          .then((value) {
        Navigator.pop(context);
      });
    }
  }

  Future<void> dadosUsuario() async {
    userid = context.read<AuthService>().usuario!.uid;
    var user = await DataBaseManager.getUser(userid);
    namecontroller.text = user.name;
    codcontroller.text = user.cod;
    turmacontroller.text = user.turma;
  }
}
