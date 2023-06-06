import 'package:flutter/material.dart';
import 'package:projeto/database/database_manager.dart';
import 'package:provider/provider.dart';

import '../components/custom_button_widget.dart';
import '../components/custom_text_field_widget.dart';
import '../model/user.dart';
import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController codcontroller = TextEditingController();
  TextEditingController turmacontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  static const backgroundGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 101, 81, 211),
      Color(0xff001233),
      Color.fromARGB(255, 98, 56, 194),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: backgroundGradient,
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Cadastro',
                style: TextStyle(fontSize: 48, color: Color(0xffE3F2FD)),
              ),
              const SizedBox(height: 60),
              CustomTextFieldWidget(
                controller: namecontroller,
                title: 'Nome',
                hintText: 'Meu Nome',
                iconData: Icons.person,
                isSpaceAllowed: true,
                isSpecialAllowed: false,
              ),
              const SizedBox(height: 15),
              CustomTextFieldWidget(
                controller: codcontroller,
                title: 'Código',
                hintText: '123456',
                iconData: Icons.assignment_ind,
                maxLength: 6,
                isNonNumericAllowed: false,
              ),
              const SizedBox(height: 15),
              CustomTextFieldWidget(
                controller: turmacontroller,
                title: 'Turma',
                hintText: '2023/01',
                iconData: Icons.school,
                maxLength: 7,
              ),
              const SizedBox(height: 15),
              CustomTextFieldWidget(
                controller: emailcontroller,
                title: 'Email',
                hintText: 'meu.email@sou.unaerp.edu.br',
                iconData: Icons.mail_outline,
              ),
              const SizedBox(height: 15),
              CustomTextFieldWidget(
                controller: passwordcontroller,
                title: 'Senha',
                hintText: '********',
                iconData: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 60),
              CustomButtonWidget(
                label: 'CADASTRAR',
                onTap: cadastrar,
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  child: const Text(
                    'Voltar',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xffE3F2FD),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }

  cadastrar() async {
    const List<String> validDomains = [
      'sou.unaerp.edu.br',
      'unaerp.br',
    ];

    List<String> splittedEmail = emailcontroller.text.split('@');
    if (emailcontroller.text.isEmpty ||
        passwordcontroller.text.isEmpty ||
        codcontroller.text.isEmpty ||
        turmacontroller.text.isEmpty ||
        namecontroller.text.isEmpty) {
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
    } else if (splittedEmail.length == 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Endereço de email inválido",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xffE3F2FD),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 59, 19, 150),
          duration: Duration(seconds: 3),
        ),
      );
    } else if (!validDomains.contains(splittedEmail[1])) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Use um email institucional",
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
      await context
          .read<AuthService>()
          .register(emailcontroller.text, passwordcontroller.text, context)
          .then(
        (value) {
          DataBaseManager.setUser(
              value,
              User(namecontroller.text, codcontroller.text,
                  turmacontroller.text));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Cadastro concluído",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xffE3F2FD),
                ),
              ),
              backgroundColor: Color.fromARGB(255, 59, 19, 150),
              duration: Duration(seconds: 3),
            ),
          );
          Navigator.pop(context);
        },
      );
    }
  }
}
