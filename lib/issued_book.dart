import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IssuedBookScreen(),
    );
  }
}

class IssuedBookScreen extends StatelessWidget {

 final List<Book> books = [
    Book(
      name: "The Happiness Equation",
      author: "Neil Pasricha",
      category: "General",
      price: 1000.00,
      rackNo: "13",
      status: "Available",
    ),
    Book(
      name: "The Happiness Equation",
      author: "Neil Pasricha",
      category: "General",
      price: 1000.00,
      rackNo: "13",
      status: "Available",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 221, 221),
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text('Issued Book', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.chat_bubble_outline, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
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
                 ElevatedButton.icon(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5), 
    ),
  ),
  onPressed: () {},
  icon: const Icon(Icons.filter_list),
  label: const Text("Filter"),
),],),
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
  final String rackNo;
  final String status;

  Book({
    required this.name,
    required this.author,
    required this.category,
    required this.price,
    required this.rackNo,
    required this.status,
  });
}


class BookCard extends StatelessWidget {
  final Book book;

  BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      
      children: [
        
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
                
                color: const Color.fromARGB(255, 18, 77, 20),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text("Available",
              style: TextStyle(
                color: Colors.white
              ),
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
                     Text(" ${book.name}"),
                     
                     Text("${book.category}"),
        
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
                     Text(" ${book.author}"),
                    
                     Text(" ${book.price.toStringAsFixed(2)}"),
        
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                     
                      
                      children: [
                        Row(
                        
                          children: [
                            Column(
                              children: [
                                Text("Rack No : "),
                                 Text("${book.rackNo}"),
                              ],
                            ),
                            SizedBox(
                              width: 270,
                            ),
                           Icon(Icons.picture_as_pdf, color: Colors.red),
                          ],
                        ),
                      
                      ],
                    ),
                  ],
                ),
                
              ],
              
            ),
            
          ),
        ),
      ],
    );
  }
}
