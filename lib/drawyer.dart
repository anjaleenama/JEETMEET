// import 'package:flutter/material.dart';

// class MyDrawerPage extends StatefulWidget {
//   const MyDrawerPage({super.key});

//   @override
//   State<MyDrawerPage> createState() => _MyDrawerPageState();
// }

// class _MyDrawerPageState extends State<MyDrawerPage> {
//   // String dropdown = "Personal";
//   // var drop = [
//   //   "Personal",
//   //   "My Profile",
//   //   "My Diaries",
//   //   "Staff Directory",
//   //   "Calender",
//   //   "Leave Application",
//   //   "Assigned Leave",
//   //   "Leave Apply"
//   // ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         drawer: Drawer(
//           child: Column(
//             children: [
//               UserAccountsDrawerHeader(
//                 decoration: BoxDecoration(color: Colors.red),
//                 accountName: Padding(
//                   padding: const EdgeInsets.only(left: 70.0),
//                   child: Text(
//                     "",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 accountEmail: Text(""),
//                 currentAccountPicture: Padding(
//                   padding: const EdgeInsets.only(top: 40.0),
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundImage: AssetImage(
//                             'assets/profileimage.png'), // Replace with actual image asset
//                         radius: 100, // Increased radius for a larger circle
//                         backgroundColor: Colors
//                             .transparent, // Ensure background is transparent
//                         child: ClipOval(
//                           child: Image.asset(
//                             'assets/profileimage.png',
//                             fit: BoxFit
//                                 .cover, // This ensures the image fills the circle
//                           ),
//                         ),
//                       ),
//                       Text("Siobhan L. Seal"),
//                     ],
//                   ),
//                 ),
//               ),
//               SidebarMenu(),

//               // DropdownButton(
//               //     value: dropdown,
//               //     icon: Icon(Icons.arrow_drop_down),
//               //     items: drop.map((String items) {
//               //       return DropdownMenuItem(value: items, child: Text(items));
//               //     }).toList(),
//               //     onChanged: (String? newvalue) {
//               //       setState(() {
//               //         dropdown = newvalue!;
//               //       });
//               //     }),
//             ],
//           ),
//         ));
//   }
// }

// class SidebarMenu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: Colors.white,
//       child: ListView(
//         children: [
//           Column(
//             children: [
//               ExpansionTile(
//                 leading: Icon(Icons.person),
//                 title: Text('Personal'),
//                 children: [
//                   ListTile(
//                     title: Text('My Profile'),
//                     onTap: () {},
//                   ),
//                   ListTile(
//                     title: Text('My Diaries'),
//                     onTap: () {},
//                   ),
//                   ListTile(
//                     title: Text('Staff Directory'),
//                     onTap: () {},
//                   ),
//                   ListTile(
//                     title: Text('Calendar'),
//                     onTap: () {},
//                   ),
//                   Theme(
//                     data:
//                         Theme.of(context).copyWith(dividerColor: Colors.white),
//                     child: ExpansionTile(
//                       title: Text('Leave Application'),
//                       children: [
//                         ListTile(
//                           title: Text('Assigned Leave'),
//                           onTap: () {},
//                         ),
//                         ListTile(
//                           title: Text('Leave Apply'),
//                           onTap: () {},
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               Theme(
//                   data: Theme.of(context).copyWith(dividerColor: Colors.white),
//                   child: ExpansionTile(
//                     leading: Icon(Icons.alarm),
//                     title: Text('Academic'),
//                     children: [
//                       ListTile(
//                         title: Text('Assignment'),
//                         onTap: () {},
//                       ),
//                       ListTile(
//                         title: Text('Subject'),
//                         onTap: () {},
//                       ),
//                       ListTile(
//                         title: Text('Library'),
//                         onTap: () {},
//                       ),
//                       ListTile(
//                         title: Text('Timetable'),
//                         onTap: () {},
//                       ),
//                       ListTile(
//                         title: Text('Attendence'),
//                         onTap: () {},
//                       ),
//                       ListTile(
//                         title: Text('Events'),
//                         onTap: () {},
//                       ),
//                     ],
//                   )),
//               Theme(
//                 data: Theme.of(context).copyWith(dividerColor: Colors.white),
//                 child: ExpansionTile(
//                   leading: Icon(Icons.book_outlined),
//                   title: Text('Library'),
//                   children: [
//                     ListTile(
//                       title: Text('Request Book'),
//                       onTap: () {},
//                     ),
//                     ListTile(
//                       title: Text('Leave Apply'),
//                       onTap: () {},
//                     ),
//                   ],
//                 ),
//               ),
//               ExpansionTile(
//                 leading: Icon(Icons.rotate_90_degrees_ccw),
//                 title: Text('Exams'),
//                 children: [
//                   ListTile(
//                     title: Text('Exam Scheduled'),
//                     onTap: () {},
//                   ),
//                   ListTile(
//                     title: Text('Attend Exam'),
//                     onTap: () {},
//                   ),
//                   ListTile(
//                     title: Text('Exam Result'),
//                     onTap: () {},
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MyDrawerPage extends StatefulWidget {
  const MyDrawerPage({super.key});

  @override
  State<MyDrawerPage> createState() => _MyDrawerPageState();
}

class _MyDrawerPageState extends State<MyDrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
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
              ListTile(title: Text('My Profile'), onTap: () {}),
              ListTile(title: Text('My Diaries'), onTap: () {}),
              ListTile(title: Text('Staff Directory'), onTap: () {}),
              ListTile(title: Text('Calendar'), onTap: () {}),
              ExpansionTile(
                title: Text('Leave Application'),
                children: [
                  ListTile(title: Text('Assigned Leave'), onTap: () {}),
                  ListTile(title: Text('Leave Apply'), onTap: () {}),
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
              ListTile(title: Text('Assignment'), onTap: () {}),
              ListTile(title: Text('Subject'), onTap: () {}),
              ListTile(title: Text('Library'), onTap: () {}),
              ListTile(title: Text('Timetable'), onTap: () {}),
              ListTile(title: Text('Attendance'), onTap: () {}),
              ListTile(title: Text('Events'), onTap: () {}),
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
              ListTile(title: Text('Request Book'), onTap: () {}),
              ListTile(title: Text('Borrowed Books'), onTap: () {}),
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
              ListTile(title: Text('Exam Scheduled'), onTap: () {}),
              ListTile(title: Text('Attend Exam'), onTap: () {}),
              ListTile(title: Text('Exam Result'), onTap: () {}),
            ],
          ),
        ),
        ListTile(
            leading: Icon(Icons.online_prediction),
            title: Text('Online Class'),
            onTap: () {}),
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
