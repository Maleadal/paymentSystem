import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:payment_system/responsive/layouts/mobile_views/login_view.dart';
import 'package:http/http.dart' as http;
import 'package:payment_system/responsive/layouts/mobile_views/payment_view.dart';
import '../../classes/student.dart';
import '../global.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  Future getStudents() async {
    var response =
        await http.get(Uri.http('localhost:8000', 'student/students'));
    var jsonData = jsonDecode(response.body);
    List<Student> studentList = [];
    for (var u in jsonData) {
      Student student = Student(
          code: u['code'],
          fullName: u['full_name'],
          sex: u['sex'],
          isPaid: false);
      studentList.add(student);
    }
    students = studentList;
  }

  @override
  void initState() {
    getStudents();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (!isLoggedIn) {
      return const LoginView();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("M O B I L E"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Options'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PaymentView(type: 'Individual')));
                    },
                    child: const Text("Individual Payment")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PaymentView(type: 'Group')));
                    },
                    child: const Text("Group Payment")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/student_list/', (route) => true);
                    },
                    child: const Text("List")),
              )
            ],
          ),
        ],
      ),
    );
  }
}
