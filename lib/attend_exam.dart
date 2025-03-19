import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AttendExam(),
    );
  }
}

class AttendExam extends StatelessWidget {
  const AttendExam({super.key});

  @override
  Widget build(BuildContext context) {
    
    List<Map<String, String>> exams = [
      {
        'date': '17-Mar-2020',
        'time': '09.30 AM - 04.30 PM',
        'examName': 'Aptitude Test',
        'examCategory': 'Test',
        'classDivision': '4 A',
        'subject': 'Mathematics',
        'room': 'Room 4',
        'instructions': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has...'
      },
      {
        'date': '18-Mar-2020',
        'time': '10.00 AM - 05.00 PM',
        'examName': 'Physics Test',
        'examCategory': 'Test',
        'classDivision': '5 B',
        'subject': 'Physics',
        'room': 'Room 5',
        'instructions': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has...'
      },
      
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 221, 221),
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text('Attend Exam', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.chat_bubble_outline, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 4,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: IntrinsicHeight(
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Copy"),
                            VerticalDivider(thickness: 1, color: Colors.grey),
                            Text("Excel"),
                            VerticalDivider(thickness: 1, color: Colors.grey),
                            Text("CSV"),
                            VerticalDivider(thickness: 1, color: Colors.grey),
                            Text("PDF"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), 
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list),
                    label: const Text("Filter"),
                  ),
                ],
              ),
            ),
           
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), 
              itemCount: exams.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exams[index]['examName']!,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Exam Category   : ${exams[index]['examCategory']}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Class & Division   : ${exams[index]['classDivision']}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Subject  : ${exams[index]['subject']}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Room  : ${exams[index]['room']}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Instruction',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          exams[index]['instructions']!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
