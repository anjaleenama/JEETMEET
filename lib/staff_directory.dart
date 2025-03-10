import 'package:flutter/material.dart';

class StaffDirectoryScreen extends StatelessWidget {
  final List<Map<String, String>> subjectList = [
    {"subject": "Maths"},
    {"subject": "Physics"},
    {"subject": "Chemistry"},
    {"subject": "Biology"},
    {"subject": "Computer Science"},
  ];

  final List<Map<String, String>> staffList = [
    {"teacher": "K Sarath, Vincent P, Muhammed PK, Anil Vk, Lithin VM"},
     {"teacher": "K Sarath, Vincent P, Muhammed PK, Anil Vk, Lithin VM"},
      {"teacher": "K Sarath, Vincent P, Muhammed PK, Anil Vk, Lithin VM"},
        {"teacher": "K Sarath, Vincent P, Muhammed PK, Anil Vk, Lithin VM"},
       {"teacher": "K Sarath, Vincent P, Muhammed PK, Anil Vk, Lithin VM"},
        {"teacher": "K Sarath, Vincent P, Muhammed PK, Anil Vk, Lithin VM"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 221, 221),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Staff Directory",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: const Color.fromARGB(255, 223, 221, 221),
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: Text(
              "Subject Teacher",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 118, 117, 117)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: subjectList.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Subject: ",
                              style: TextStyle(color: Colors.black54, fontSize: 16),
                            ),
                            Text(
                              "${subjectList[index]['subject']}",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color:Color.fromARGB(255, 118, 117, 117),
                            ),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Teachers: ",
                              style: TextStyle(fontSize: 14, color: Colors.black54),
                            ),
                            Expanded(
                              child: Text(
                                "${staffList[index]['teacher']}",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,color:Color.fromARGB(255, 118, 117, 117),
                              ),
                            ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

