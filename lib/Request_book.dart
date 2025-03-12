import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RequestBook(),
    );
  }
}

class RequestBook extends StatelessWidget {
  final List<Book> books = [
    Book(
      name: "The Happiness Equation",
      author: "Neil Pasricha",
      category: "General",
      price: 1000.00,
      status: "Available",
    ),
    Book(
      name: "The Happiness Equation",
      author: "Neil Pasricha",
      category: "General",
      price: 1000.00,
      status: "Requested",
    ),
    Book(
      name: "The Happiness Equation",
      author: "Neil Pasricha",
      category: "General",
      price: 1000.00,
      status: "Available",
    ),
    Book(
      name: "The Happiness Equation",
      author: "Neil Pasricha",
      category: "General",
      price: 1000.00,
      status: "Available",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 221, 221),
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text('Request Books', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.chat_bubble_outline, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                    child: IntrinsicHeight(
                      child: const Row(
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
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                return BookCard(book: books[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Book {
  final String name;
  final String author;
  final String category;
  final double price;
  String status;

  Book({
    required this.name,
    required this.author,
    required this.category,
    required this.price,
    required this.status,
  });
}

class BookCard extends StatefulWidget {
  final Book book;

  BookCard({required this.book});

  @override
  _BookCardState createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Status:"),
            SizedBox(
              width: 8,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              decoration: BoxDecoration(
                color: widget.book.status == "Available"
                    ? const Color.fromARGB(255, 18, 77, 20)
                    : Colors.orange,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                widget.book.status,
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Card(
          shadowColor: Colors.black,
          elevation: 2,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Name : "),
                    Text("Category "),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${widget.book.name}",
                    style:TextStyle(
                      fontWeight: FontWeight.bold
                    ) ,),
                    Text("${widget.book.category}",
                    style:TextStyle(
                      fontWeight: FontWeight.bold
                    ) ,),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Author : "),
                    Text("Price:"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${widget.book.author}",
                    style:TextStyle(
                      fontWeight: FontWeight.bold
                    ) ,),
                    Text(" ${widget.book.price.toStringAsFixed(2)}",
                    style:TextStyle(
                      fontWeight: FontWeight.bold
                    ) ,),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                Row(
                  children: [
                    Text(
                      "More details ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.keyboard_arrow_down_outlined),
                    SizedBox(
                      width: 170
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (widget.book.status == "Available") {
                            widget.book.status = "Requested";
                          } else {
                            widget.book.status = "Available";
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: widget.book.status == "Available"
                            ? const Color.fromARGB(255, 1, 4, 54)
                            : Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                      ),
                      child: Text(
                        widget.book.status == "Available" ? "Request" : "Cancel",
                        style: TextStyle(fontSize: 13),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
