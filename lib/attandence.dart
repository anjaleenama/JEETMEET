import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  late final ValueNotifier<DateTime> _selectedDay;
  late final ValueNotifier<DateTime> _focusedDay;


final List greendate=[DateTime.utc(2020,12,9)];
final List reddate=[DateTime.utc(2020,12,10)];
  @override
  void initState() {
    super.initState();
    _selectedDay = ValueNotifier(DateTime.now());
    _focusedDay = ValueNotifier(DateTime.now());
  }

  @override
  void dispose() {
    _selectedDay.dispose();
    _focusedDay.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 205, 205),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 5, 5),
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        title: Text("Attandence",style: TextStyle(color: Colors.white,fontSize: 15),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.message,color: Colors.white,))
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10
                )
              ],
               color: Colors.white,
            ),
            height: 409,
           
            child: TableCalendar(
              firstDay: DateTime(2020),
              lastDay: DateTime(2029),
              focusedDay: _focusedDay.value,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay.value, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay.value = selectedDay;
                  _focusedDay.value = focusedDay;
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay.value = focusedDay;
              },
            
             calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, date, _) {
                if(greendate.any((element) => isSameDay(element,date))){
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(
                      '${date.day}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  );
                }
                else if (reddate.any((element) => isSameDay(element, date))) {
                return Container(
                  margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(
                      '${date.day}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }
              
              }
              
              ),
              headerStyle: HeaderStyle(
                
                titleCentered: true,
                leftChevronIcon: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle
                  ),
                  height: 40,width: 40,
                  child: Card(
                      elevation: 5,
                      
                      
                      // padding: EdgeInsets.all(8),
                      // decoration: BoxDecoration(
                      //   color: Colors.white,
                      //   boxShadow: [BoxShadow(
                      //     blurRadius: 2,
                      //     color: Colors.grey
                      //   )],
                      //   borderRadius: BorderRadius.circular(8),
                      // ),
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.black,
                      ),
                    ),
                ),
                  rightChevronIcon: Container(height: 40,width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle
                  ),
                    child: Card(
                      
                      elevation: 5,
                      
                      
                      // padding: EdgeInsets.all(8),
                      // decoration: BoxDecoration(
                      //   boxShadow: [BoxShadow(
                      //     blurRadius: 2,
                      //     color: Colors.grey
                      //   )],
                      //   color: Colors.white,
                      //   borderRadius: BorderRadius.circular(8),
                      // ),
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                      ),
                    ),
                  ),
              ),
              availableCalendarFormats: const{ CalendarFormat.month:'Month'},
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CircleAvatar(backgroundColor: Colors.red,radius: 5,),
              ),
              SizedBox(width: 5,),
              Text("Absent")
            ],
            
          ),
          SizedBox(width: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CircleAvatar(backgroundColor: Colors.green,radius: 5,),
              ),
              SizedBox(width: 5,),
              Text("Present")
            ],
          ),

        ],
      ),
    );
  }
}
