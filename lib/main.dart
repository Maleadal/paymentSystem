import 'package:flutter/material.dart';
import 'package:payment_system/responsive/layouts/desktop_layout.dart';
import 'package:payment_system/responsive/layouts/mobile_layout.dart';
import 'package:payment_system/responsive/layouts/mobile_views/login_view.dart';
import 'package:payment_system/responsive/layouts/mobile_views/student_list_views.dart';
import 'package:payment_system/responsive/layouts/tablet_layout.dart';
import 'package:payment_system/responsive/responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const Widget home = ResponsiveLayout(
      mobileLayout: MobileLayout(),
      tabletLayout: TabletLayout(),
      desktopLayout: DesktopLayout(),
    );
    return MaterialApp(
      routes: {
        '/login/': (context) => const LoginView(),
        '/home/': (context) => const MyApp(),
        '/student_list/': (context)=> const StudentList()
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: home,
    );
  }
}
