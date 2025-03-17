import 'package:flutter/material.dart';

class Online extends StatefulWidget {
  const Online({super.key});

  @override
  State<Online> createState() => _OnlineState();
}

class _OnlineState extends State<Online> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 200, 202),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 234, 11, 11),
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back),color: Colors.white,),
        title: Text("Online Exam",style: TextStyle(fontSize: 15,color: Colors.white),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.message),color: Colors.white,)
        ],
      
      ),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,bottom: 250,top: 50),
          child: Stack(
            clipBehavior: Clip.none,
            children:[ 
              Column(
                children: [
                  Card(
                      color: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        
                          children: [
                           
                            
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Row(
                                children: [
                                  Text("Subject"),
                                  SizedBox(width: 120,),
                                  Text(": Chemistry")
                                ],
                              ),
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text("Exam Name"),
                                SizedBox(width: 90,),
                                Text(": Exam Category")
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text("Class & Division"),
                                SizedBox(width: 65,),
                                Text(": 4 A")
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text("Type of Division"),
                                SizedBox(width: 65,),
                                Text(": Mathe Matics")
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text("Total Questions"),
                                SizedBox(width: 66,),
                                Text(": 4")
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text("Total Mark"),
                                SizedBox(width: 98,),
                                Text(": 100")
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text("Total Time"),
                                SizedBox(width: 99,),
                                Text(": 1.5 hr")
                              ],
                            ),
                            
                          ],
                        ),
                        
                      ),
                            ),
                            
                           Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Please Read Instruction Carefully",style: TextStyle(color: const Color.fromARGB(255, 231, 34, 20)),),
                                    SizedBox(height: 5,),
                                    Text("Lorem Ipsum is simply Lorem Ipsum is simply Lorem Ipsum is simply  Lorem Ipsum is simply  Lorem Ipsum is simply  Lorem Ipsum is simply  Lorem Ipsum is simply Lorem Ipsum is simply"),
                                  ],
                                ),
                              ),
                           ),
                           SizedBox(height: 90,),
                           Container(
                            width: 350,
                            height: 40,
                            child: ElevatedButton(onPressed: (){}, child: Text("Start Exam",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor:  Color.fromARGB(255, 234, 11, 11)),))
                ],
              ),
            Positioned(
              left: 140,
              top: -30,
              child:  ClipRRect(
                
                  child:  Image.asset("assets/Ellipse 1.png",fit: BoxFit.fill,width: 100,height: 100,))),
              
                
         ] 
         ),
        ),
        
        
             ] ),
      )
      );
    
  }
}