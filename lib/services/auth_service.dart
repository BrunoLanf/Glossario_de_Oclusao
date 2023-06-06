import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  register(String email, String password, BuildContext context) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (value) {
          value.user!.sendEmailVerification();
        },
      );
      _getUser();
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "A senha é fraca",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xffE3F2FD),
              ),
            ),
            backgroundColor: Color.fromARGB(255, 59, 19, 150),
            duration: Duration(seconds: 3),
          ),
        );
      } else if (error.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Este email já está sendo usado",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xffE3F2FD),
              ),
            ),
            backgroundColor: Color.fromARGB(255, 59, 19, 150),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
    return usuario?.uid;
  }

  void _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  resetPassword(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (error) {
      if (error.code != 'user-not-found') {
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
      }
    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }

  login(String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Endereço de email ou senha inválido",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xffE3F2FD),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 59, 19, 150),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
