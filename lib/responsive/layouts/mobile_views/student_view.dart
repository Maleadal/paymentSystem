import 'package:flutter/material.dart';
import 'package:payment_system/classes/student.dart';

class StudentView extends StatefulWidget {
  final Student student;
  const StudentView({Key? key, required this.student}) : super(key: key);

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Status - ${widget.student.fullName}'),
      ),
      body: Column(children: [
        Row(
          children: [const Text("Full Name: "), Text(widget.student.fullName)],
        ),
        Row(
          children: [const Text("Code: "), Text(widget.student.code)],
        ),
        Row(
          children: [
            const Text("Sex: "),
            Text(widget.student.sex == 0 ? "Female" : "Male")
          ],
        ),
        Row(
          children: [
            const Text("Status (Paid): "),
            Container(
              color: widget.student.isPaid ? Colors.green : Colors.red,
              width: width * 0.2,
              height: height * 0.02,
            )
          ],
        )
      ]),
    );
  }
}
