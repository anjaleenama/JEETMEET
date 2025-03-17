import 'package:flutter/material.dart';
import 'package:project_internship/examschedule.dart';

//import 'package:project_internship/personcontent.dart';
//import 'package:project_intern/onlineexam.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home:Schedule
    (),debugShowCheckedModeBanner: false,);
  }
}