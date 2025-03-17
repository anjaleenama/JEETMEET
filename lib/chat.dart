import 'package:flutter/material.dart';
import 'package:jeet_meet/chatcontent.dart';


class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: 
    Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepOrange,
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        bottom: TabBar(
       labelColor: Colors.white,
       
       //unselectedLabelColor: const Color.fromARGB(255, 175, 178, 179),
       tabs: [
        
       Tab(text: "Admin Chat",),
       Tab(text: "Teacher Chat",),
      
                ],
                
                ),
      ),
      body: TabBarView(children: [
        Content(),
        Content()
      ]),
      // body: Container(
      //           color: Colors.deepOrange,
      //           height: 50,
      //           child: TabBar(
      //  labelColor: Colors.white,
       
      //  //unselectedLabelColor: const Color.fromARGB(255, 175, 178, 179),
      //  tabs: [
        
      //  Tab(text: "Admin Chat",),
      //  Tab(text: "Teacher Chat",),
      
      //           ],
                
      //           ),
      //         ),
    
    ),
    
    );
  }
}