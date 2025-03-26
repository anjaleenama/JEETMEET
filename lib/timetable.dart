import 'package:flutter/material.dart';

class MyTimeTable extends StatelessWidget {
  const MyTimeTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 222, 222),
      appBar: AppBar(
        title: Text(
          "Time Table Report",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.message_sharp,
              color: Colors.white,
            ),
          )
        ],
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                      color: Colors.white,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(3))),
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
                                )
                              ],
                            )),
                      ))
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Monday",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                  Text("Tuesday"),
                  Text("Wednesday"),
                  Text("Thursday"),
                ],
              ),
            ),
            SizedBox(height: 10),
            TimeTableCard(
                period: "01",
                subject: "Maths",
                teacher: "K Sarath",
                startTime: "09:00 am",
                endTime: "10:15 am",
                room: "Room No. 1"),
            TimeTableCard(
                period: "02",
                subject: "Maths",
                teacher: "K Sarath",
                startTime: "09:00 am",
                endTime: "10:15 am",
                room: "Room No. 1"),
            TimeTableCard(
                period: "03",
                subject: "Maths",
                teacher: "K Sarath",
                startTime: "09:00 am",
                endTime: "10:15 am",
                room: "Room No. 1"),
            TimeTableCard(
                period: "04",
                subject: "Maths",
                teacher: "K Sarath",
                startTime: "09:00 am",
                endTime: "10:15 am",
                room: "Room No. 1"),
            TimeTableCard(
                period: "05",
                subject: "Maths",
                teacher: "K Sarath",
                startTime: "09:00 am",
                endTime: "10:15 am",
                room: "Room No. 1"),
            TimeTableCard(
                period: "06",
                subject: "Maths",
                teacher: "K Sarath",
                startTime: "09:00 am",
                endTime: "10:15 am",
                room: "Room No. 1"),
          ],
        ),
      ),
    );
  }
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
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 91, 90, 90), width: 3),
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Period\n$period",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
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
                color: const Color.fromARGB(255, 91, 90, 90),
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
      ),
    );
  }
}
