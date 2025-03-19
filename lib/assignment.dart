import 'package:flutter/material.dart';
import 'package:project_internship/chat.dart';

class Assignment extends StatefulWidget {
  const Assignment({super.key});

  @override
  State<Assignment> createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 233, 233),
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: Text(
            "Assignment",
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.message,
                  color: Colors.white,
                ))
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("COPY"),
                        ),
                        SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            color: Colors.grey,
                            thickness: 1,
                            width: 30,
                          ),
                        ),
                        Text("Excel"),
                        SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            color: Colors.grey,
                            thickness: 1,
                            width: 30,
                          ),
                        ),
                        Text("CSV"),
                        SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            color: Colors.grey,
                            thickness: 1,
                            width: 30,
                          ),
                        ),
                        Text("PDF"),
                      ],
                    ),
                    width: 240,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 100,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.filter_alt_outlined,
                                color: Colors.grey,
                              ),
                              Text(
                                "Filter",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                              backgroundColor: Colors.white))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Class: 4 A",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 121, 120, 120)),
                  ),
                  SizedBox(width: 97),
                  Text("Academic Year : 2020-2021",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 121, 120, 120),
                      ))
                ],
              ),
            ),
            Container(
              height: 280,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Text("New Testing"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Category Name",
                            style: TextStyle(
                                color: Color.fromARGB(255, 121, 120, 120)),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 20),
                              child: Text("Deadline : "),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                "2021-04-10",
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Subject : Maths",
                            style: TextStyle(
                                color: Color.fromARGB(255, 121, 120, 120)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 170, left: 10),
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.attach_file),
                                Text("Attachment.png"),
                              ],
                            ),
                            style: OutlinedButton.styleFrom(
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(2))),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Contrary to popular belief, Lorem Ipsum is not simply\nrandom text. It has roots in a piece of",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 121, 120, 120),
                                  )),
                              Text(
                                "More",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: const Color.fromARGB(
                                        255, 141, 138, 138)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Class: 4 A",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 121, 120, 120)),
                  ),
                  SizedBox(width: 97),
                  Text("Academic Year : 2020-2021",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 121, 120, 120),
                      ))
                ],
              ),
            ),
            Container(
              height: 280,
              child: Card(
                elevation: 5,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text("New Testing"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Category Name",
                          style: TextStyle(
                              color: Color.fromARGB(255, 121, 120, 120)),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 20),
                            child: Text("Deadline : "),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              "2021-04-10",
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Subject : Maths",
                          style: TextStyle(
                              color: Color.fromARGB(255, 121, 120, 120)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 180, left: 10),
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.attach_file),
                              Text("Attachment.png"),
                            ],
                          ),
                          style: OutlinedButton.styleFrom(
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(2))),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                            "Contrary to popular belief, Lorem Ipsum is not simply\nrandom text. It has roots in a piece of ",
                            style: TextStyle(
                              color: Color.fromARGB(255, 121, 120, 120),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "More",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: const Color.fromARGB(255, 141, 138, 138)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
