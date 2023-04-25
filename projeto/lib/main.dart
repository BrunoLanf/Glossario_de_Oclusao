import 'package:flutter/material.dart';
import 'view/login_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
    theme: ThemeData(fontFamily: 'Oswald'),
  ));
}
