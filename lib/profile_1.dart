import 'package:flutter/material.dart';

// ignore: must_be_immutable
class myprofileone extends StatelessWidget {
  var head = [
    "Programming Contest",
    "Annual Sports Day",
    "Annual Sports Day",
    "Second Semester Exam",
  ];
  var subhead = [
    "On 20-11-2018 will held a programming \n contest on the ",
    "	In your school campus on 1-03-2018 wil.. ",
    "	In your school campus on 1-03-2018 wil.. ",
    "Your second semester exam will held\n on 30-08-2018.Pl.. "
  ];
  myprofileone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(180, 40),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 300.0, top: 10.0),
                  child: Icon(
                    Icons.flag,
                    color: Colors.white,
                    size: 30,
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
                        padding: const EdgeInsets.only(top: 310),
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
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.5,
                child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 25,
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage("assets/Frame.png"),
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
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text("${head[index]}"),
                                  subtitle: Text("${subhead[index]}"),
                                  trailing: Icon(
                                    Icons.forward_sharp,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                  height: 5,
                                  color: Colors.black,
                                );
                              },
                              itemCount: head.length),
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
