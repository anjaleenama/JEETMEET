import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalendarPage(),
    );
  }
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late final ValueNotifier<DateTime> _selectedDay;
  late final ValueNotifier<DateTime> _focusedDay;

  // Sample dates to highlight
  final List<DateTime> greenDates = [
    DateTime.utc(2025, 3, 5),
    DateTime.utc(2025, 3, 10),
  ];

  final List<DateTime> redDates = [
    DateTime.utc(2025, 3, 15),
    DateTime.utc(2025, 3, 20),
  ];

  @override
  void initState() {
    super.initState();
    _selectedDay = ValueNotifier(DateTime.now());
    _focusedDay = ValueNotifier(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Calendar Example'),
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2025, 1, 1),
        lastDay: DateTime.utc(2025, 12, 31),
        focusedDay: _focusedDay.value,
        selectedDayPredicate: (day) {
          // Use the selected day predicate to highlight the selected date
          return isSameDay(_selectedDay.value, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay.value = selectedDay;
            _focusedDay.value = focusedDay;
          });
        },
        calendarBuilders: CalendarBuilders(
          // Custom builder for day cells
          defaultBuilder: (context, date, _) {
            // Check if the date is in the green or red list
            if (greenDates.any((element) => isSameDay(element, date))) {
              return Container(
                margin: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${date.day}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            } else if (redDates.any((element) => isSameDay(element, date))) {
              return Container(
                margin: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${date.day}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }

            // Default builder for other dates
            return null;
          },
        ),
      ),
    );
  }
}
