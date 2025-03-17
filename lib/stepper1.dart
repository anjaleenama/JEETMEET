

// // import 'package:flutter/material.dart';

// // class Horizontall extends StatefulWidget {
// //   const Horizontall({super.key});

// //   @override
// //   State<Horizontall> createState() => _HorizontallState();
// // }

// // class _HorizontallState extends State<Horizontall> {
// //   List<Step> stepList()=>[
// //     Step(title: Text(""), content: Stack(
// //       children:[ 
// //         Column(crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Container(
// //             decoration: BoxDecoration(
// //               color: 
// //               const Color.fromARGB(255, 3, 156, 95),
// //               borderRadius: BorderRadius.circular(10)
// //             ),
// //             width: 350,height: 40,),
// //             SizedBox(height: 10,),
// //             Text("What is PHP Artision in Larawel"),
// //             Container(
// //               width: double.infinity,
// //               height: 100,
// //               child: TextField(
// //                 decoration: InputDecoration(
// //                   hintText: "Enter Answer",
// //                   fillColor: Colors.white,
// //                   filled: true,
// //                   border: OutlineInputBorder(
// //                     borderSide: BorderSide.none,
// //                     borderRadius: BorderRadius.circular(10)
// //                   ),
                  
                
// //                 ),
                
// //               ),
// //             )
// //         ],
// //       ),
// //         Padding(
// //           padding: const EdgeInsets.only(left: 10,top: 10),
// //           child: Text("Descriptive Type",style: TextStyle(color: Colors.white),),
// //         )
// //   ])
      
// //       ),
// //      Step(title: Text(''), content: Center(child: Container())),
// //       Step(title: Text(''), content: Center(child: Container(),)),
// //        Step(title: Text(''), content: Center(child: Container())),
// //   ];
// //   @override
// //   Widget build(BuildContext context) {

// //     return Scaffold(
// //       backgroundColor: Colors.grey,
// //       body: Stepper(
// //         type: StepperType.Horizontalll,
// //         steps: stepList(),
// //     )
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:project_internship/onlineexam.dart';

// class Schedulee extends StatefulWidget {
//   const Schedulee({super.key});

//   @override
//   State<Schedulee> createState() => _ScheduleeState();
// }

// class _ScheduleeState extends State<Schedulee> {
//   TimeOfDay selectedtime = TimeOfDay.now();

//   List<Step> stepList() => [
//         Step(title: Text(""), content: Text("worl"))
//       ];

//   Future<void> selectedTime() async {
//     final picked = await showTimePicker(context: context, initialTime: selectedtime);
//     if (picked != null && picked != selectedtime) {
//       setState(() {
//         selectedtime = picked;
//       });
//       print("${selectedtime.hour.toString().padLeft(2, '0')}:${selectedtime.minute.toString().padLeft(2, '0')}");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 218, 212, 212),
//       appBar: AppBar(
//         backgroundColor: Colors.deepOrange,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => Online()));
//             },
//             icon: Icon(
//               Icons.arrow_back,
//               color: Colors.white,
//             )),
//         title: Text(
//           "Exam",
//           style: TextStyle(color: Colors.white, fontSize: 15),
//         ),
//       ),
//       body: Column(
//         children: [
//           // Time selection container
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: Container(
//               width: 350,
//               height: 40,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: Text(
//                       "${selectedtime.hour.toString().padLeft(2, '0')}:${selectedtime.minute.toString().padLeft(2, '0')}",
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       selectedTime();
//                     },
//                     icon: Icon(Icons.alarm),
//                   ),
//                 ],
//               ),
//             ),
//           ),
          
//           // Stepper horizontal
//           Stepper(
//             steps: stepList(),
//             type: StepperType.horizontal,
//           ),
//         ],
//       ),
//     );
//   }
// }













// Container(
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 160,top: 10),
//                   child: Text("${selectedtime.hour.toString().padLeft(2, '0')}:${selectedtime.minute.toString().padLeft(2, '0')}"),
//                 ),
//                 width: 220,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 203, 218, 230),
//                   borderRadius: BorderRadius.circular(20)
                  
//                 ),
//               )