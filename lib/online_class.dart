import 'package:flutter/material.dart';



class OnlineClassScreen extends StatelessWidget {
  final List<String> classes = [
    "4 A",
    "4 A",
    "4 A",
  ];

  final List<String> subjects = [
    "Mathe Matics",
    "Mathe Matics",
    "Mathe Matics",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 224, 223, 223),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Online Class",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.chat_bubble_outline_outlined, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           
           
          
           
            SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: classes.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.start,
              children: [
              
                Text(
                  "Date: 17-Mar-2020",
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                SizedBox(width:180,),
                 Text(
              "09:30 AM - 04:30 PM",
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
           
              ],
            ),
              SizedBox(height: 10),
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation:3,
                        margin: EdgeInsets.only(bottom: 10),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Exam Title",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.grey),
                              ),
                              SizedBox(height: 5),
                      
                              
                              Row(
                                children: [
                                  Text(
                                    "Class & Division  : ",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                   Text(
                                    " ${classes[index]}",
                                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                      
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(fontSize: 14, color: Colors.black),
                                  children: [
                                    TextSpan(text: "Subject  :  "),
                                    TextSpan(
                                      text: subjects[index],
                                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                      
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  ),
                                  child: Text("Start", style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}