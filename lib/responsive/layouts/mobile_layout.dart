import 'package:flutter/material.dart';
import 'package:payment_system/responsive/layouts/mobile_views/login_view.dart';

import '../global.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  @override
  Widget build(BuildContext context) {
    if(!isLoggedIn){
      return const LoginView();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("M O B I L E"),
      ),
    );
  }
}
