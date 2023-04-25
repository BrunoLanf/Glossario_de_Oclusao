import 'package:flutter/material.dart';

import '../components/custom_button_widget.dart';
import '../components/custom_text_field_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
              const CustomTextFieldWidget(
                title: 'Nome',
                hintText: 'Meu Nome',
                iconData: Icons.person,
                isSpaceAllowed: true,
                isSpecialAllowed: false,
              ),
              const SizedBox(height: 15),
              const CustomTextFieldWidget(
                title: 'Código',
                hintText: '123456',
                iconData: Icons.assignment_ind,
                maxLength: 6,
                isNonNumericAllowed: false,
              ),
              const SizedBox(height: 15),
              const CustomTextFieldWidget(
                title: 'Turma',
                hintText: '2023/01',
                iconData: Icons.school,
                maxLength: 7,
              ),
              const SizedBox(height: 15),
              const CustomTextFieldWidget(
                title: 'Email',
                hintText: 'meu.email@sou.unaerp.edu.br',
                iconData: Icons.mail_outline,
              ),
              const SizedBox(height: 15),
              const CustomTextFieldWidget(
                title: 'Senha',
                hintText: '********',
                iconData: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 60),
              CustomButtonWidget(
                label: 'CADASTRAR',
                onTap: () {
                  Navigator.pop(context);
                },
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
}
