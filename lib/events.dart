import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  final List<Map<String, String>> events = [
    {
      "title": "Shanghai International School Uniform Exhibition",
      "type": "Event Type",
      "date": "25 - 05 - 2021",
      "exDate": "30 - 05 - 2021",
      "classDivision": "4 A",
      "time": "10.00 AM"
    },
    {
      "title": "Shanghai International School Uniform Exhibition",
      "type": "Event Type",
      "date": "25 - 05 - 2021",
      "exDate": "30 - 05 - 2021",
      "classDivision": "4 A",
      "time": "10.00 AM"
    }
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
          IconButton(
              icon: Icon(Icons.search), onPressed: () {}, color: Colors.white),
          IconButton(
              icon: Icon(Icons.chat_bubble_outline),
              onPressed: () {},
              color: Colors.white),
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
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return buildEventCard(events[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(text, style: TextStyle(fontSize: 14)),
    );
  }

  Widget buildDivider() {
    return IntrinsicHeight(
      child: VerticalDivider(thickness: 1, color: Colors.grey),
    );
  }

  Widget buildEventCard(Map<String, String> event) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event["title"]!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            buildEventDetail("Type", event["type"]!),
            SizedBox(height: 8),
            buildEventDetail("Date", event["date"]!),
            SizedBox(height: 8),
            buildEventDetail("Ex Date", event["exDate"]!),
            SizedBox(height: 8),
            buildEventDetail("Class & Division", event["classDivision"]!),
            SizedBox(height: 8),
            buildEventDetail("Time", event["time"]!),
          ],
        ),
      ),
    );
  }

  Widget buildEventDetail(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Text(label,
              style: TextStyle(fontSize: 14, color: Colors.black)),
        ),
        Expanded(
          flex: 1,
          child: Text(":",
              style: TextStyle(fontSize: 14, color: Colors.black)),
        ),
        Expanded(
          flex: 4,
          child: Text(value,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}