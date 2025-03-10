import 'package:flutter/material.dart';

class AssignedLeavePage extends StatelessWidget {
  final List<Map<String, String>> leaves = List.generate(
    6,
    (index) => {"type": "Annual Leave", "days": "10 Days"},
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
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
              SizedBox(width: 8),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 2,
                ),
                onPressed: () {},
                icon: Icon(Icons.filter_list),
                label: Text("Filter"),
              ),
            ],
          ),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: leaves.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white
                ,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(leaves[index]["type"]!, style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(leaves[index]["days"]!, style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}