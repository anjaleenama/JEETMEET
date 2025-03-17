import 'package:flutter/material.dart';

class assign extends StatefulWidget {
  const assign({super.key});

  @override
  State<assign> createState() => _assignState();
}

class _assignState extends State<assign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Row(
  children: [
    Container(
      color: Colors.white,  // Set background color to white
      width: 80,  // Add width for the text and divider area
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("Copy", style: TextStyle(color: Colors.grey)),
          ),
          VerticalDivider(
            color: Colors.grey,
            thickness: 1,
            width: 10,  // Adjust the space between text and divider
          ),
        ],
      ),
    ),
    Container(
      color: Colors.white,  // Set background color to white
      width: 80,  // Adjust width for next item
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("Excel", style: TextStyle(color: Colors.grey)),
          ),
          VerticalDivider(
            color: Colors.grey,
            thickness: 1,
            width: 10,
          ),
        ],
      ),
    ),
    Container(
      color: Colors.white,  // Set background color to white
      width: 80,  // Adjust width for next item
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("CSV", style: TextStyle(color: Colors.grey)),
          ),
          VerticalDivider(
            color: Colors.grey,
            thickness: 1,
            width: 10,
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(10),
      child: Text("PDF", style: TextStyle(color: Colors.grey)),
    ),
  ],
)

,

    );
  }
}