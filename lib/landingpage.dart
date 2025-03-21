import 'package:flutter/material.dart';

class MyLandingPage extends StatefulWidget {
  const MyLandingPage({super.key});

  @override
  State<MyLandingPage> createState() => _MyLandingPageState();
}

class _MyLandingPageState extends State<MyLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        SizedBox(
          height: 100,
          width: double.infinity,
        ),
        Container(
            height: 250,
            width: double.infinity,
            child: Image.asset("assets/landingpage.png")),
        SizedBox(
          height: 30,
          width: double.infinity,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            "Student",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
              minimumSize: Size(220, 55),
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        ),
        SizedBox(
          height: 20,
          width: double.infinity,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            "Parent",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
              side: BorderSide(color: Colors.grey),
              minimumSize: Size(220, 55),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        ),
      ]),
    );
  }
}
