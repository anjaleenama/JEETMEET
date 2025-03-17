import 'package:flutter/material.dart';

class Mydashboard extends StatelessWidget {
  const Mydashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 203, 203),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Stack(
            children: [
              Container(
                height: 500,
                decoration: BoxDecoration(
                  //shape: BoxShape.circle,
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60)),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    SizedBox(height: 60),
                    Text(
                      "JEETMEET",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                spreadRadius: 2,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage("assets/profileimage.png"),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Siobhan L. Seal",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("Reg No : 12345",
                                  style: TextStyle(color: Colors.grey)),
                              SizedBox(height: 5),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Class - 4",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Division - A",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Roll No -12",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "DOB -14-12-2020",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 215.0, left: 115),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("assets/Ellipse 3.png"),
                        ),
                      )
                    ]),
                    // SizedBox(height: 1),

                    SizedBox(height: 8),
                    Text(
                      "Madhu pk",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Parent",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: Icon(Icons.menu, color: Colors.white, size: 30),
              ),
              Positioned(
                top: 40,
                right: 20,
                child: Icon(Icons.flag, color: Colors.white, size: 30),
              ),
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
                                backgroundImage: AssetImage("assets/Frame.png"),
                                backgroundColor: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Notice",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 25,
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
        ]),
      ),
    );
  }
}
