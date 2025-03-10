import 'package:flutter/material.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> subject = {
      'class': '10th Grade',
      'subjectCode': 'MTH101',
      'subjectName': 'Mathematics',
      'teachers': ['John Doe', 'Jane Smith'],
      'subjectAuthor': 'Dr. Albert',
      'passMark': 40,
      'finalMark': 100,
      'note': 'This subject covers algebra, geometry, and calculus.'
    };

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 221, 221),
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text('Subject', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.chat_bubble_outline, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      
                      padding: const EdgeInsets.symmetric(vertical: 30),
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
                        child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 2,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list),
                  label: const Text("Filter"),
                ),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Class: ${subject['class']}   Subject Code: ${subject['subjectCode']}",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Divider(),
                    const Text("Subject Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(subject['subjectName'], style: const TextStyle(fontSize: 14)),
                    const SizedBox(height: 5),
                    const Text("Teacher", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(subject['teachers'].join(", "), style: const TextStyle(fontSize: 14)),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text("Subject Author: ", style: const TextStyle(fontSize: 14)),
                        Text("${subject['subjectAuthor']}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Pass Mark: ", style: const TextStyle(fontSize: 14)),
                        Text(" ${subject['passMark']}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                      ],
                    ),
                    Row(
                      children: [
                        Text("Final Mark:", style: const TextStyle(fontSize: 14)),
                        Text(" ${subject['finalMark']}",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text("Note:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(subject['note'], style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
