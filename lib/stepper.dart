// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HorizontalStepper_horiExample(),
//     );
//   }
// }

// class HorizontalStepper_horiExample extends StatefulWidget {
//   @override
//   _HorizontalStepper_horiExampleState createState() => _HorizontalStepper_horiExampleState();
// }

// class _HorizontalStepper_horiExampleState extends State<HorizontalStepper_horiExample> {
//   int _currentStep = 0; // Track the current step
//   List<Step> steps = [
//     Step(
//       title: Text('Step 1'),
//       content: Text('This is the first step'),
//       isActive: true,
//     ),
//     Step(
//       title: Text('Step 2'),
//       content: Text('This is the second step'),
//       isActive: true,
//     ),
//     Step(
//       title: Text('Step 3'),
//       content: Text('This is the final step'),
//       isActive: true,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Horizontal Stepper_hori Example'),
//       ),
//       body: Stepper_hori(
//         type: Stepper_horiType.horizontal, // Make it horizontal
//         currentStep: _currentStep,
//         onStepTapped: (step) => setState(() {
//           _currentStep = step;
//         }),
//         onStepContinue: () {
//           if (_currentStep < steps.length - 1) {
//             setState(() {
//               _currentStep++;
//             });
//           } else {
//             // Handle completion (you can show a message or navigate)
//             print('All steps completed!');
//           }
//         },
//         onStepCancel: () {
//           if (_currentStep > 0) {
//             setState(() {
//               _currentStep--;
//             });
//           }
//         },
//         steps: steps,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Stepper_hori extends StatefulWidget {
  const Stepper_hori({super.key});

  @override
  State<Stepper_hori> createState() => _Stepper_horiState();
}

class _Stepper_horiState extends State<Stepper_hori> {
  List<Step> stepList()=>[
    Step(title: Text(""), content: Stack(
      children:[ 
        Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: 
              const Color.fromARGB(255, 3, 156, 95),
              borderRadius: BorderRadius.circular(10)
            ),
            width: 350,height: 40,),
            SizedBox(height: 10,),
            Text("What is PHP Artision in Larawel"),
            Container(
              width: double.infinity,
              height: 100,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter Answer",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  
                
                ),
                
              ),
            )
        ],
      ),
        Padding(
          padding: const EdgeInsets.only(left: 10,top: 10),
          child: Text("Descriptive Type",style: TextStyle(color: Colors.white),),
        )
  ])
      
      ),
     Step(title: Text(''), content: Center(child: Container())),
      Step(title: Text(''), content: Center(child: Container(),)),
       Step(title: Text(''), content: Center(child: Container())),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [

          Text("hdghegdhw"),
          SizedBox(height: 20,)
,          Container(height: 500,width: double.infinity,color: Colors.amber,
  child: Stepper(
              type: StepperType.horizontal,
              steps: stepList(),
                ),
),
        ],
      )
    );
  }
}
