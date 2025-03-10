import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
 void showLeaveApplicationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Leave Application"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: "Category"),
              items: ["Sick Leave", "Casual Leave", "Annual Leave"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {},
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Starting Date",
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "End Date",
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Reason"),
              maxLines: 3,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Attachment",
                suffixIcon: Icon(Icons.attach_file),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Submit"),
          ),
        ],
      );
    },
  );
}