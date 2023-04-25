import 'package:flutter/material.dart';

import '../components/custom_button_widget.dart';
import '../components/custom_text_field_widget.dart';

class PasswordRecoveryPage extends StatefulWidget {
  const PasswordRecoveryPage({super.key});

  @override
  State<PasswordRecoveryPage> createState() => _PasswordRecoveryPageState();
}

class _PasswordRecoveryPageState extends State<PasswordRecoveryPage> {
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
      decoration: const BoxDecoration(gradient: backgroundGradient),
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Recuperar Senha',
                style: TextStyle(fontSize: 38, color: Color(0xffE3F2FD)),
              ),
              const SizedBox(height: 140),
              const CustomTextFieldWidget(
                title: 'Confirme seu email',
                hintText: 'meu.email@sou.unaerp.edu.br',
                iconData: Icons.mail_outline,
              ),
              const SizedBox(height: 5),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Será enviado um email de confirmação para alterar a conta',
                  style: TextStyle(fontSize: 14, color: Color(0xffE3F2FD)),
                ),
              ),
              const SizedBox(height: 200),
              CustomButtonWidget(
                label: 'Enviar',
                onTap: () {},
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
