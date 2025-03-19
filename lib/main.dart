import 'package:flutter/material.dart';
import 'package:jeet_meet/loginpage.dart';
import 'package:jeet_meet/profile.dart';
import 'package:jeet_meet/profile_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyLoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
