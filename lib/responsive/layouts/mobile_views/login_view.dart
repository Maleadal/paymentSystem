import 'package:flutter/material.dart';
import 'package:payment_system/main.dart';

import '../../global.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    if (isLoggedIn) {
      return const MyApp();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Not logged in"),
      ),
      body: Center(
        child: TextButton(
          child: const Text("Log in"),
          onPressed: () {
            setState(() {
              isLoggedIn = true;
            });
          },
        ),
      ),
    );
  }
}
