import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto/services/auth_service.dart';
import 'package:projeto/view/login_page.dart';
import 'package:projeto/view/register_page.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'view/home_page.dart';
//import 'view/login_page.dart';
import 'view/quiz_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: const GlossaryApp(),
    ),
  );
}

class GlossaryApp extends StatelessWidget {
  const GlossaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(fontFamily: 'Oswald'),
    );
  }
}
