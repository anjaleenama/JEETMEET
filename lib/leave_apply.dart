import 'package:flutter/material.dart';

class LeaveApplicationScreen extends StatefulWidget {
  @override
  _LeaveApplicationScreenState createState() => _LeaveApplicationScreenState();
}

class _LeaveApplicationScreenState extends State<LeaveApplicationScreen> {
  List<Map<String, String>> leaveApplications = [
    {
      "date": "25 - 05 - 2021",
      "status": "Pending",
      "applicant": "Lithin K M",
      "category": "Annual",
      "schedule": "Sat-Mar-2021 - Mon-Mar-2021",
      "days": "02",
      "reason": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "actionReason": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "attachment": "Attachment.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 221, 221),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 250,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
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
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: leaveApplications.length,
              itemBuilder: (context, index) {
                var leave = leaveApplications[index];
                return LeaveApplicationCard(leave: leave);
              },
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: FloatingActionButton.extended(
          onPressed: () {
            showLeaveApplicationDialog(context);
          },
          label: Text("Add a Leave Application"),
          icon: Icon(Icons.add),
          backgroundColor: Colors.red,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class LeaveApplicationCard extends StatelessWidget {
  final Map<String, String> leave;

  const LeaveApplicationCard({Key? key, required this.leave}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Date : ${leave["date"]}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    leave["status"]!,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Applicant Name\n${leave["applicant"]}", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Category\n${leave["category"]}", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Schedule\n${leave["schedule"]}"),
                Text("Days\n${leave["days"]}"),
              ],
            ),
            SizedBox(height: 10),
            Text("Reason", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(leave["reason"]!),
            SizedBox(height: 10),
            Text("Action Reason", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(leave["actionReason"]!),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.attachment, color: Colors.grey),
                SizedBox(width: 5),
                Text(leave["attachment"]!, style: TextStyle(color: Colors.blue)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showLeaveApplicationDialog(BuildContext context) {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      controller.text = "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
    }
  }

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
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: startDateController,
                    decoration: InputDecoration(labelText: "Starting Date"),
                    readOnly: true,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context, startDateController),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: endDateController,
                    decoration: InputDecoration(labelText: "End Date"),
                    readOnly: true,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context, endDateController),
                ),
              ],
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
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Submit"),
          ),
        ],
      );
    },
  );
}
