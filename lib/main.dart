import 'package:flutter/material.dart';
import 'package:project_internship/assign.dart';
import 'package:project_internship/assignment.dart';
import 'package:project_internship/attandence.dart';
import 'package:project_internship/calendar.dart';
import 'package:project_internship/chat.dart';
import 'package:project_internship/chatcontent.dart';
import 'package:project_internship/examschedule.dart';
import 'package:project_internship/onlineexam.dart';
import 'package:project_internship/person.dart';
import 'package:project_internship/stepp.dart';
import 'package:project_internship/stepper.dart';
import 'package:project_internship/stepper1.dart';
//import 'package:project_internship/personcontent.dart';
//import 'package:project_intern/onlineexam.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Assignment(),
      debugShowCheckedModeBanner: false,
    );
  }
}
