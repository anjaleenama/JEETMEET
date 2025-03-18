import 'package:flutter/material.dart';
import 'package:jeet_meet/Exam_result2.dart';
import 'package:jeet_meet/Exam_result3.dart';
import 'package:jeet_meet/Request_book.dart';
import 'package:jeet_meet/assigned_leave.dart';
import 'package:jeet_meet/assignment.dart';
import 'package:jeet_meet/attandence.dart';
import 'package:jeet_meet/attend_exam.dart';
import 'package:jeet_meet/calender.dart';
import 'package:jeet_meet/diary.dart';
import 'package:jeet_meet/events.dart';
import 'package:jeet_meet/examschedule.dart';
import 'package:jeet_meet/issued_book.dart';
import 'package:jeet_meet/leave_apply.dart';
import 'package:jeet_meet/online_class.dart';
import 'package:jeet_meet/profile.dart';
import 'package:jeet_meet/staff_directory.dart';
import 'package:jeet_meet/subject.dart';
import 'package:jeet_meet/timetable.dart';

class MyDrawerPage extends StatefulWidget {
  const MyDrawerPage({super.key});

  @override
  State<MyDrawerPage> createState() => _MyDrawerPageState();
}

class _MyDrawerPageState extends State<MyDrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Expanded(
          child: ListView(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/profileimage.png',
                                ),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 8),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Siobhan L. Seal",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SidebarMenu(),
            ],
          ),
        ),
     
    );
  }
}

class SidebarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('DashBoard'),
            onTap: () {}),
        Theme(
          data: Theme.of(context).copyWith(
            expansionTileTheme: ExpansionTileThemeData(
              tilePadding: EdgeInsets.symmetric(horizontal: 16.0),
              childrenPadding: EdgeInsets.only(left: 32.0),
              shape: Border(),
              //collapsedShape: Border()
            ),
          ),
          child: ExpansionTile(
            leading: Icon(Icons.person),
            title: Text('Personal'),
            children: [
              ListTile(title: Text('My Profile'), onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfileScreen()));
              }),
              ListTile(title: Text('My Diaries'), onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> DiaryScreen()));
              }),
              ListTile(title: Text('Staff Directory'), onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> StaffDirectoryScreen()));
              }),
              ListTile(title: Text('Calendar'), onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CalendarScreen()));
              }),
              ExpansionTile(
                title: Text('Leave Application'),
                children: [
                  ListTile(title: Text('Assigned Leave'), onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AssignedLeavePage()));
                  }),
                  ListTile(title: Text('Leave Apply'), onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveApplicationScreen()));
                  }),
                ],
              ),
            ],
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(
            expansionTileTheme: ExpansionTileThemeData(
              tilePadding: EdgeInsets.symmetric(horizontal: 16.0),
              childrenPadding: EdgeInsets.only(left: 32.0),
              shape: Border(),
              // collapsedShape: Border(),
            ),
          ),
          child: ExpansionTile(
            leading: Icon(Icons.alarm),
            title: Text('Academic'),
            children: [
              ListTile(title: Text('Assignment'), onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Assignment()));
              }),
              ListTile(title: Text('Subject'), onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectScreen()));
              }),
              // ListTile(title: Text('Library'), onTap: () {}),
              ListTile(title: Text('Timetable'), onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyTimeTable()));
              }),
              ListTile(title: Text('Attendance'), onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Attendance()));
              }),
              ListTile(title: Text('Events'), onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=> EventsScreen())); 
              }),
            ],
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(
            expansionTileTheme: ExpansionTileThemeData(
              tilePadding: EdgeInsets.symmetric(horizontal: 16.0),
              childrenPadding: EdgeInsets.only(left: 32.0),
              shape: Border(),
            ),
          ),
          child: ExpansionTile(
            leading: Icon(Icons.book_outlined),
            title: Text('Library'),
            children: [
              ListTile(title: Text('Request Book'), onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> RequestBook()));
              }),
              ListTile(title: Text('Borrowed Books'), onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>IssuedBookScreen()));
              }),
            ],
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(
            expansionTileTheme: ExpansionTileThemeData(
              tilePadding: EdgeInsets.symmetric(horizontal: 16.0),
              childrenPadding: EdgeInsets.only(left: 32.0),
              shape: Border(),
            ),
          ),
          child: ExpansionTile(
            leading: Icon(Icons.rotate_90_degrees_ccw),
            title: Text('Exams'),
            children: [
              ListTile(title: Text('Exam Scheduled'), onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Schedule()));
              }),
              ListTile(title: Text('Attend Exam'), onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AttendExam()));
              }),
              ListTile(title: Text('Exam Result'), onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ExamResultScreen1()));
              }),
            ],
          ),
        ),
        ListTile(
            leading: Icon(Icons.online_prediction),
            title: Text('Online Class'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>OnlineClassScreen()));
            }),
        ListTile(
            leading: Icon(Icons.logout), title: Text('Logout'), onTap: () {}),
        SizedBox(
          height: 40,
          width: double.infinity,
        ),
        Row(
          children: [
            SizedBox(
              width: 40,
            ),
            Icon(Icons.save),
            Icon(Icons.save),
            Icon(Icons.save),
            Icon(Icons.save),
          ],
        )
      ],
    );
  }
}
