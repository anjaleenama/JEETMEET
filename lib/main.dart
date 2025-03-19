import 'package:flutter/material.dart';
import 'package:jeetmeet/events.dart';
import 'package:jeetmeet/online_class.dart';
import 'package:jeetmeet/subject.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      home:EventsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

