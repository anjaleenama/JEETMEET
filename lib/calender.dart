import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.utc(2020, 12, 9);
  DateTime _focusedDay = DateTime.utc(2020, 12, 9);

  final Set<DateTime> _highlightedDays = {
    DateTime.utc(2020, 12, 9),
    DateTime.utc(2020, 12, 16),
    DateTime.utc(2020, 12, 26),
  };

  final Map<DateTime, List<String>> _events = {
    DateTime.utc(2020, 12, 9): ['Assignment Deadline'],
    DateTime.utc(2020, 12, 16): ['Assignment Deadline'],
    DateTime.utc(2020, 12, 26): ['Assignment Deadline'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.white),
        title: Text('Calendar', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        actions: [
          IconButton(icon: Icon(Icons.chat_bubble_outline), onPressed: () {}, color: Colors.white),
        ],
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2021, 1, 1),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            eventLoader: (day) => _events[day] ?? [],
            
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, date, _) {
                bool isHighlighted = _highlightedDays.any((d) =>
                    date.year == d.year && date.month == d.month && date.day == d.day);

                if (isHighlighted) {
                  return Container(
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.orange, 
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${date.day}',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }
                return null;
              },
            ),
          ),
          Expanded(
            child: ListView(
              children: _events.entries
                  .where((entry) => isSameDay(entry.key, _selectedDay))
                  .expand((entry) => entry.value)
                  .map((event) => Card(
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: ListTile(
                          leading: Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              _selectedDay.day.toString(),
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          title: Text(event),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
