import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RequestBook1(),
    );
  }
}

class RequestBook1 extends StatelessWidget {

 final List<Book> books = [
    Book(
      name: "The Happiness Equation",
      author: "Neil Pasricha",
      category: "General",
      price: 1000.00,
      subject: "Nil",
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
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 45),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
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
        ],),
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
  final String subject;
  final String rackNo;
  final String status;

  Book({
    required this.name,
    required this.author,
    required this.category,
    required this.price,
    required this.subject,
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
                                Text("Subject :"),
                                Text("${book.subject}"),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            
                            Column(
                              children: [
                                Text("Rack No : "),
                                 Text("${book.rackNo}"),
                              ],
                            ),
                            SizedBox(
                              width: 140,
                            ),
                           Icon(Icons.picture_as_pdf, color: Colors.red),
                          ],
                        ),
                      
  

                      
                      ],
                      
                    ),
                    
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
                    Text("Less details "),
                    Icon(Icons.keyboard_arrow_up_outlined),
                    SizedBox(
                      width: 180,
                    ),
                   ElevatedButton(
  onPressed: () {}, 
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 1, 4, 54), 
    foregroundColor: Colors.white, 
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
  ),
  child: Text("Request", style: TextStyle(fontSize: 13)),
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

