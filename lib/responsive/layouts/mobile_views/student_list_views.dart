import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:payment_system/responsive/layouts/mobile_views/student_view.dart';
import '../../../classes/student.dart';
import '../../global.dart';

class StudentList extends StatefulWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  late final TextEditingController search;

  Future getStudents(String query, String filter) async {
    var response = query.isNotEmpty
        ? await http.get(Uri.http(
            'localhost:8000', 'student/query', {filter.toLowerCase(): query}))
        : await http.get(Uri.http('localhost:8000', 'student/students'));
    if (response.statusCode == 200) {
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
      shownStudents = studentList;
    } else {
      print(response.body);
    }
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Student List'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width * 0.3,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: const Text("Search by: "),
                    value: shownValue,
                    icon: const Icon(Icons.arrow_downward),
                    items: menuItems
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text('By $e'),
                            ))
                        .toList(),
                    onChanged: (value) => setState(() {
                      shownValue = value;
                    }),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.5,
                child: TextField(
                  decoration:
                      const InputDecoration(hintText: "Search for student: "),
                  controller: search,
                ),
              ),
              SizedBox(
                  width: width * 0.2,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          getStudents(search.text, shownValue!);
                        });
                      },
                      child: const Text("Search")))
            ],
          ),
          SizedBox(
            width: width,
            height: height * 0.8,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: shownStudents.length,
              itemBuilder: (context, index) {
                String fullName = shownStudents[index].fullName;
                String code = shownStudents[index].code;
                String sex = shownStudents[index].sex == 0 ? "Female" : "Male";
                bool isPaid = shownStudents[index].isPaid;
                return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      color: Colors.grey.withOpacity(0.2),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StudentView(
                                      student: shownStudents[index])));
                        },
                        title: Text(fullName),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Code: $code'),
                            Text('Sex: $sex'),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text('Status: '),
                                Container(
                                  // ignore: dead_code
                                  color: isPaid ? Colors.green : Colors.red,
                                  width: width * 0.2,
                                  height: height * 0.02,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
