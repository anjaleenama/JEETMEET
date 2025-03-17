import 'package:flutter/material.dart';

class myCompletedPage extends StatelessWidget {
  const myCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 2, 71),
      body: Column(
        children: [
          Stack(children: [
            Container(
                height: 900,
                width: double.infinity,
                child: Image.asset("assets/completedpage.png")),
            Padding(
              padding: const EdgeInsets.only(top: 140.0, left: 140),
              child: ClipOval(
                child: Image.asset(
                  "assets/profileimage.png",
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 420, left: 5),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Completed",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 23, 2, 71),
                          fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(color: Colors.grey),
                        minimumSize: Size(370, 55),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23))),
                  ),
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                  ),
                  Text(
                    "Total Questions",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                    width: double.infinity,
                  ),
                  Text(
                    "5",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 220,
                    width: double.infinity,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(5)),
                        side: BorderSide(color: Colors.white),
                        backgroundColor: const Color.fromARGB(255, 23, 2, 71),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Back To Home",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
