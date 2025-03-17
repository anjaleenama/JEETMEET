import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Time Table'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TimeTableCard(
                period: "06",
                subject: "Maths",
                teacher: "K Sarath",
                startTime: "09:00 am",
                endTime: "10:15 am",
                room: "Room No. 1"),
            SizedBox(height: 10),
            TimeTableCard(
                period: "07",
                subject: "Maths",
                teacher: "K Sarath",
                startTime: "09:00 am",
                endTime: "10:15 am",
                room: "Room No. 1"),
          ],
        ),
      ),
    ),
  ));
}

class TimeTableCard extends StatelessWidget {
  final String period, subject, teacher, startTime, endTime, room;

  TimeTableCard(
      {required this.period,
      required this.subject,
      required this.teacher,
      required this.startTime,
      required this.endTime,
      required this.room});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 4, spreadRadius: 1),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Period\n$period",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Subject\n$subject",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Teacher\n$teacher",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Start Time\n$startTime",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text("End Time\n$endTime",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text("Room\n$room",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
