import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  final List<Map<String, String>> titleList = [
    {"title": "Shanghai International School Uniform Exhibition"},
    {"title": "Shanghai International School Uniform Exhibition"}
  ];

  final List<Map<String, String>> typeList = [
    {"type": "Event Type"},
    {"type": "Event Type"}
  ];

  final List<Map<String, String>> dateList = [
    {"date": "25-05-2021"},
    {"date": "25-05-2021"}
  ];

  final List<Map<String, String>> exDateList = [
    {"exDate": "30-05-2021"},
    {"exDate": "30-05-2021"}
  ];

  final List<Map<String, String>> classDivisionList = [
    {"classDivision": "4 A"},
    {"classDivision": "4 A"}
  ];

  final List<Map<String, String>> timeList = [
    {"time": "10:00 AM"},
    {"time": "10:00 AM"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 223, 221, 221),
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.white),
        title: Text("Events", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}, color: Colors.white),
          IconButton(icon: Icon(Icons.chat_bubble_outline), onPressed: () {}, color: Colors.white),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              width: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Copy"),
                  IntrinsicHeight(child: VerticalDivider(thickness: 1, color: Colors.grey)),
                  Text("Excel"),
                  IntrinsicHeight(child: VerticalDivider(thickness: 1, color: Colors.grey)),
                  Text("CSV"),
                  IntrinsicHeight(child: VerticalDivider(thickness: 1, color: Colors.grey)),
                  Text("PDF"),
                  
                ],
              ),
            ),
          ),
          
          Expanded(
            child: ListView.builder(
              itemCount: titleList.length,
              itemBuilder: (context, index) {
                return buildEventCard(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEventCard(int index) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titleList[index]["title"]!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            buildEventDetail("Type", typeList[index]["type"]!),
            buildEventDetail("Date", dateList[index]["date"]!),
            buildEventDetail("Ex Date", exDateList[index]["exDate"]!),
            buildEventDetail("Class & Division", classDivisionList[index]["classDivision"]!),
            buildEventDetail("Time", timeList[index]["time"]!),
          ],
        ),
      ),
    );
  }

  Widget buildEventDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 14, color: Colors.black),
          children: [
            TextSpan(text: "$label: "),
            TextSpan(
              text: value,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
