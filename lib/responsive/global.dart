import 'package:flutter/material.dart';

import '../classes/student.dart';

bool isLoggedIn = false;
late List<Student> shownStudents;
List<Student> students = [];
late List<Student> searchStudents;

String? shownValue;
List<String> menuItems = ['Name', 'Code'];
