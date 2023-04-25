import 'package:flutter/material.dart';
import 'package:projeto/view/home_page.dart';
import 'package:projeto/view/register_page.dart';
import '../components/custom_button_widget.dart';
import '../components/custom_text_field_widget.dart';

import 'password_recovery_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                'Login',
                style: TextStyle(fontSize: 48, color: Color(0xffE3F2FD)),
              ),
              const SizedBox(height: 80),
              const CustomTextFieldWidget(
                title: 'Email',
                hintText: 'meu.email@sou.unaerp.edu.br',
                iconData: Icons.mail_outline,
              ),
              const SizedBox(height: 30),
              const CustomTextFieldWidget(
                title: 'Senha',
                hintText: '********',
                iconData: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: const Text(
                    'Esqueceu sua senha?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xffE3F2FD),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const PasswordRecoveryPage()));
                  },
                ),
              ),
              const SizedBox(height: 120),
              CustomButtonWidget(
                label: 'ENTRAR',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                    child: const Text(
                      'Cadastrar-se',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xffE3F2FD),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    }),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
