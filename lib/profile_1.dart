import 'package:flutter/material.dart';
import 'package:jeet_meet/chat.dart';
import 'package:jeet_meet/drawyer.dart';

class myprofileone extends StatelessWidget {
  myprofileone({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: MyDrawerPage(),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 450,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: InkWell(
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 300.0, top: 10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Chat()));
                    },
                    child: Icon(
                      Icons.message_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 130.0, top: 10.0),
                  child: Text(
                    "JEETMEET",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Stack(alignment: Alignment.center, children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 120.0, bottom: 100),
                      child: Container(
                        height: 240,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 50),
                            const Text(
                              "Siobhan L. Seal",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "Reg No: 12345",
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text("Class: 4",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey)),
                                Text("Division: A",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  "Roll No: 12",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                Text("DOB: 14-12-2020",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 220.0),
                      child: Container(
                        width: 100, // Adjust for size
                        height: 100, // Adjust for size
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // border: Border.all(
                          //     color: Colors.white, width: 2), // Optional border
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/profileimage.png'), // Replace with your image
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 330),
                        child: Column(children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage("assets/Ellipse 3.png"),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Madhu pk",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const Text(
                            "Parent",
                            style: TextStyle(color: Colors.white),
                          ),
                        ])),
                    SizedBox(
                      height: 40,
                    ),
                  ]),
                )
              ],
            ),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Rounded corners
              ),
              elevation: 5,
              margin: EdgeInsets.all(16),
              child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                      mainAxisSize:
                          MainAxisSize.min, // Takes only required height
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/Frame.png"),
                                  backgroundColor: Colors.white,
                                  radius: 10,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Notice",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text("Programming Contest",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Row(
                              children: [
                                Text(
                                    "On 20-11-2018 will held a programming \n contest on the "),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.forward_sharp,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text("Annual Sports Day",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Row(
                              children: [
                                Text(
                                    "	In your school campus on 1-03-2018 wil.. "),
                                // SizedBox(
                                //   width: ,
                                // ),
                                Icon(
                                  Icons.forward_sharp,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text("Annual Sports Day",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Row(
                              children: [
                                Text(
                                    "	In your school campus on 1-03-2018 wil.. "),
                                // SizedBox(
                                //   width: 70,
                                // ),
                                Icon(
                                  Icons.forward_sharp,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            Text(
                              "Second Semester Exam",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Row(
                              children: [
                                Text(
                                    "Your second semester exam will held\n on 30-08-2018.Pl.. "),
                                SizedBox(
                                  width: 30,
                                ),
                                Icon(
                                  Icons.forward_sharp,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ],
                        ),
                      ])),
            )
          ],
        ),
      ),
    );
  }
}
