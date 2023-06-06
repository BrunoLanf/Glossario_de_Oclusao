import 'package:flutter/material.dart';
import 'package:projeto/view/home_page.dart';
import 'package:projeto/view/register_page.dart';
import 'package:provider/provider.dart';
import '../components/custom_button_widget.dart';
import '../components/custom_text_field_widget.dart';

import '../services/auth_service.dart';
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

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
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
              CustomTextFieldWidget(
                controller: emailcontroller,
                title: 'Email',
                hintText: 'meu.email@sou.unaerp.edu.br',
                iconData: Icons.mail_outline,
              ),
              const SizedBox(height: 30),
              CustomTextFieldWidget(
                controller: passwordcontroller,
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
                onTap: logar,
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

  logar() async {
    const List<String> validDomains = [
      'sou.unaerp.edu.br',
      'unaerp.br',
    ];

    List<String> splittedEmail = emailcontroller.text.split('@');
    if (emailcontroller.text.isEmpty || passwordcontroller.text.isEmpty) {
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
          .login(emailcontroller.text, passwordcontroller.text, context)
          .then(
        (value) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        },
      );
    }
  }
}
