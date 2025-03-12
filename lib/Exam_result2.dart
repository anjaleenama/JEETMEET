import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExamResultScreen1(),
    );
  }
}

class ExamResultScreen1 extends StatefulWidget {
  const ExamResultScreen1({super.key});

  @override
  State<ExamResultScreen1> createState() => _ExamResultScreenState();
}

class _ExamResultScreenState extends State<ExamResultScreen1> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 235, 238, 1),
      appBar: AppBar(
        leading:Icon(Icons.arrow_back,color: Colors.white,),
        title: const Text('Exam Result',
        style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromRGBO(238, 36, 36, 1),
        
        actions: [
          IconButton(
            icon: const Icon(Icons.search,
            color: Colors.white,),
            onPressed: () {},
          ),
          IconButton(onPressed: () {},
           icon:Icon(Icons.chat_bubble_outline,color: Colors.white,))
        ],
      ),
  
      body: Column(
        
        children: [
          GestureDetector(
            
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10,10, 10, 10),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16,),
                    color:Color.fromRGBO(101, 101, 101, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Exam Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          color: Colors.white,
                          isExpanded ? Icons.arrow_drop_up_sharp : Icons.arrow_drop_up_outlined),
                          
                      ],
                    ),
                  ),
                   Container(
                    
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16,),
                    color: Colors.white,
                    width: 5000,
                    height: 110,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    
                      children: [
                        Text("Type of Exam          :Test"),
                       
                        Text("Exam Name             :Annual"),
                       
                        Text("Total Questions       :3"),
                       
                        Text("Total Mark                :3"),
                    
                      ],
                    ),
                  ),
                ],
                
              ),
            ),
          ),
            
          Container(
            
            child: Expanded(
            
              
              child: ListView.builder(
                
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ExamQuestionCard(index: index + 1);
                },
              ),
            ),
          ),
         
         
          Container(
            padding: const EdgeInsets.all(12),
            color: Color.fromRGBO(238, 36, 36, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Total Mark - 10',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Grade - 55.55',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExamQuestionCard extends StatefulWidget {
  final int index;

  const ExamQuestionCard({super.key, required this.index});

  @override
  State<ExamQuestionCard> createState() => _ExamQuestionCardState();
}

class _ExamQuestionCardState extends State<ExamQuestionCard> {
  @override
  Widget build(BuildContext context) {
return Column(
  children: [
    Stack(
      children: [
        Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has ...',
                  style: const TextStyle(fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(83, 83, 83, 1)),
                ),
                const SizedBox(height: 10),
                Divider(color: Colors.grey), 
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Question Mark - 2',
                        style: TextStyle(color: Color.fromARGB(255, 39, 37, 37))),
                    Text('Mark - 1',
                        style: TextStyle(color: Color.fromARGB(255, 39, 37, 37))),
                  ],
                  
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
    SizedBox(
      height: 130,
    ),
        Positioned(
          bottom: 1, 
          right: 0.10, 
          
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 150, vertical:0.5),
            width: 120, 
            child: ElevatedButton(
              onPressed: () {
               
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:Color.fromRGBO(90, 90, 126, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: const Text(
                'View Q & A',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    ),
  ],
);




    }
}
