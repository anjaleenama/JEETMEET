import 'package:flutter/material.dart';
import 'package:jeet_meet/onlineexam.dart';


class Scheduleee extends StatefulWidget {
  const Scheduleee({super.key});

  @override
  State<Scheduleee> createState() => _ScheduleeeState();
}

class _ScheduleeeState extends State<Scheduleee> {
  TimeOfDay selectedtime = TimeOfDay.now();

  List<Step> stepList() => [
        const Step(title: Text(''), content: Center(child: Text('Account'))),
        const Step(title: Text('Address'), content: Center(child: Text('Address'))),
        const Step(title: Text('Confirm'), content: Center(child: Text('Confirm')))
      ];

  Future<void> selectedTime() async {
    final picked = await showTimePicker(context: context, initialTime: selectedtime);
    if (picked != null && picked != selectedtime) {
      setState(() {
        selectedtime = picked;
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
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Online()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          "Exam",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: 350,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "${selectedtime.hour.toString().padLeft(2, '0')}:${selectedtime.minute.toString().padLeft(2, '0')}",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          // The Stepper widget below the container
          Stepper(
            steps: stepList(),
            type: StepperType.horizontal,
          ),
        ],
      ),
    );
  }
}
