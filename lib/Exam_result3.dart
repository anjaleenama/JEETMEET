import 'package:flutter/material.dart';


void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExamResult3(),
    );
  }
}

class ExamResult3 extends StatelessWidget {
  const ExamResult3({super.key});

   @override
   Widget build(BuildContext context) {
 

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 221, 221),
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text('Exam Result', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.chat_bubble_outline, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 4,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: IntrinsicHeight(
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Copy"),
                          VerticalDivider(thickness: 1, color: Colors.grey),
                          Text("Excel"),
                          VerticalDivider(thickness: 1, color: Colors.grey),
                          Text("CSV"),
                          VerticalDivider(thickness: 1, color: Colors.grey),
                          Text("PDF"),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
               
               ElevatedButton.icon(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5), // Adjust this value to decrease the radius
    ),
  ),
  onPressed: () {},
  icon: const Icon(Icons.filter_list),
  label: const Text("Filter"),
)

              ],
            ),
          ),
         
          Padding(
            padding: const EdgeInsets.only(),
            child: Row(
             children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text("Date : 17-Mar-2020"),
                    SizedBox(width:110),
                    Text("09.30 AM - 04.30 PM"),
                  ],
                ),
              )
             ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
            
            
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                
                color: Colors.grey.withOpacity(0.5),
            
              
              ),
            
            ],
            
          ),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Aptitude Test',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Exam Category   : Test',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Class & Division   : 4 A',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Subject  : Mathematics',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Room  : Room 4',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Instruction',
                style: TextStyle(
                  fontSize: 14,
                
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has...',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 23, 2, 75),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                ),
                onPressed: () {},
               child:Text("View",style:TextStyle(
                color: Colors.white
               ),)),
            ],
          
          ),
          
        ),
      ),
      
      //    
        ],
      ),
      );
    
  }
}