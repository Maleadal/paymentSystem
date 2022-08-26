import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../classes/student.dart';
import '../../global.dart';

class StudentList extends StatefulWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  late final TextEditingController search;

  // TODO: FIX THIS SHIT
  Future getStudents(String query) async {
    print(query);
    var response = await http
        .get(Uri.http('localhost:3000', 'api/students/query?name=$query'));
    var jsonData = jsonDecode(response.body);
    List<Student> studentList = [];
    for (var u in jsonData) {
      Student student =
          Student(code: u['code'], fullName: u['full_name'], sex: u['sex']);
      studentList.add(student);
    }
    searchStudents = studentList;
  }

  @override
  void initState() {
    search = TextEditingController();
    shownStudents = students;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isClicked = false;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Student List'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  decoration:
                      const InputDecoration(hintText: "Search for student: "),
                  controller: search,
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          getStudents(search.text);
                          shownStudents = searchStudents;
                        });
                      },
                      child: const Text("Search")))
            ],
          ),
          SizedBox(
            width: width,
            height: height * 0.8,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                        color: Colors.black.withOpacity(0.3),
                        child: Text(
                            'Full Name: ${shownStudents[index].fullName}\nCode: ${shownStudents[index].code}\nSex: ${shownStudents[index].sex == 0 ? "Female" : "Male"}')));
              },
            ),
          )
        ],
      ),
    );
  }
}
