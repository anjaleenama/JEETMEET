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
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildTextButton("Copy"),
                      buildDivider(),
                      buildTextButton("Excel"),
                      buildDivider(),
                      buildTextButton("CSV"),
                      buildDivider(),
                      buildTextButton("PDF"),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal:40, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.filter_list, color: Colors.black),
                      SizedBox(width: 5),
                      Text("Filter"),
                    ],
                  ),
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
                    buildDetailRow("Subject Name", subject['subjectName']),
                    buildDetailRow("Teacher", subject['teachers'].join(", ")),
                    buildDetailRow("Subject Author", subject['subjectAuthor']),
                    buildDetailRow("Pass Mark", subject['passMark'].toString()),
                    buildDetailRow("Final Mark", subject['finalMark'].toString()),
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

  /// Builds a text button inside the top options container
  Widget buildTextButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(text, style: TextStyle(fontSize: 14)),
    );
  }

  /// Creates a vertical divider between text buttons
  Widget buildDivider() {
    return const VerticalDivider(thickness: 1, color: Colors.grey);
  }

  /// Creates a row for subject details with proper spacing
  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text("$label: ", style: const TextStyle(fontSize: 14)),
          Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}