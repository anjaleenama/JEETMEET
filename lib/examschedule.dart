
import 'package:flutter/material.dart';
import 'package:jeet_meet/onlineexam.dart';


class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  TimeOfDay selectedtime=TimeOfDay.now();
  List<Step> stepList()=>[
      
        Step(title: Text(''), content: Center(child: Stack(
          children:[ Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 39, 221, 133),
                borderRadius: BorderRadius.circular(10)
              ),
              width: double.infinity,
              height: 40,
              ),
              SizedBox(height: 10,),
              Text("What is PHP Artisan in Laravel?"),
              SizedBox(height: 10,),
              TextField(
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: "Enter Answer",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                    
                  ),
                  fillColor: Colors.white,
                  filled: true
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 240),
                child: Container(
                  width: 100,height: 30,
                  child: ElevatedButton(onPressed: (){}, child: Text("Next",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),)),
              )
            ],
          ),
          
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("Descriptive Type"),
          ),
   ] ))),
         const Step(title: Text(''), content: Center(child: Text(''),)),
          const Step(title: Text(''), content: Center(child: Text(''),)),
          const Step(title: Text(''), content: Center(child: Text(''),)),
          
  ];

Future<void>selectedTime() async{
  final  picked=await showTimePicker(context: context, initialTime: selectedtime);
  if(picked !=null && picked !=selectedtime){
    setState(() {
      selectedtime=picked;
    });
    print("${selectedtime.hour.toString().padLeft(2, '0')}:${selectedtime.minute.toString().padLeft(2, '0')}");
  }
}

  @override
  Widget build(BuildContext context) {
   
   
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 212, 212),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        leading: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Online()));}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        title: Text("Exam",style: TextStyle(color: Colors.white,fontSize: 15),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              
              children:[ Container(
                
                
                
                // color: Colors.white,
                width: 350,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                  
                ),
                
              ),
              
              Padding(
                padding: const EdgeInsets.only(left: 290,top: 2),
                child: IconButton(onPressed: (){selectedTime();}, icon: Icon(Icons.alarm))
              ),
              Stack(
                children:[ Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 160,top: 10),
                    child: Text("${selectedtime.hour.toString().padLeft(2, '0')}:${selectedtime.minute.toString().padLeft(2, '0')}"),
                  ),
                  width: 220,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 203, 218, 230),
                    borderRadius: BorderRadius.circular(20)
                    
                  ),
                ),
              ]),
             
         ] )
            
          ),

         
           Container(
           
            height: 510,width: double.infinity,
            //color: Color.fromARGB(255, 196, 200, 202),
             child: Theme(
               data: ThemeData(shadowColor:const Color.fromARGB(255, 218, 212, 212),
          canvasColor:  const Color.fromARGB(255, 218, 212, 212),
         
        ),
               child: Stepper(steps: stepList(),elevation: 0,
                  type: StepperType.horizontal,
                  ),
             ),
           )
        
        ],
       
    ));
  }
}