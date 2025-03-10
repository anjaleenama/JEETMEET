import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Sidebar Menu')),
        body: Row(
          children: [
            SidebarMenu(),
            Expanded(
              child: Center(child: Text('Content Area')),
            ),
          ],
        ),
      ),
    );
  }
}

class SidebarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          Column(
            children: [
              ExpansionTile(
                leading: Icon(Icons.person),
                title: Text('Personal'),
                children: [
                  ListTile(
                    title: Text('My Profile'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('My Diaries'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Staff Directory'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Calendar'),
                    onTap: () {},
                  ),
                  Theme(
                    data:
                        Theme.of(context).copyWith(dividerColor: Colors.white),
                    child: ExpansionTile(
                      title: Text('Leave Application'),
                      children: [
                        ListTile(
                          title: Text('Assigned Leave'),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text('Leave Apply'),
                          onTap: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.white),
                  child: ExpansionTile(
                    leading: Icon(Icons.alarm),
                    title: Text('Academic'),
                    children: [
                      ListTile(
                        title: Text('Assignment'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('Subject'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('Library'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('Timetable'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('Attendence'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('Events'),
                        onTap: () {},
                      ),
                    ],
                  )),
              Theme(
                data: Theme.of(context).copyWith(dividerColor: Colors.white),
                child: ExpansionTile(
                  leading: Icon(Icons.book_outlined),
                  title: Text('Library'),
                  children: [
                    ListTile(
                      title: Text('Request Book'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text('Leave Apply'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              ExpansionTile(
                leading: Icon(Icons.rotate_90_degrees_ccw),
                title: Text('Exams'),
                children: [
                  ListTile(
                    title: Text('Exam Scheduled'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Attend Exam'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Exam Result'),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
