import 'package:flutter/material.dart';
import 'package:jeet_meet/chat.dart';


class Person extends StatefulWidget {
  final  nam,images;
 Person({super.key,  this.nam,this.images});

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {
  List message=[];
  @override
  Widget build(BuildContext context) {
    
    TextEditingController messagectl=TextEditingController();
    void sendMessage(){
      setState(() {
        if(messagectl.text.isNotEmpty){
          message.add(messagectl.text);
          messagectl.clear();
        }
      });
    }
    
    return Scaffold(backgroundColor: const Color.fromARGB(255, 236, 233, 233),
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Chat()));}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.deepOrange,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("${widget.images}"),
              
            ),
            SizedBox(width: 10,),
            Text("${widget.nam}",style: TextStyle(fontSize: 14),),
            
          ],
        )
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              
              itemCount: message.length,
              itemBuilder: (BuildContext context,int index){
                return Align(
                  
                  alignment: Alignment.centerRight,
                  child: Container(
                    
                     margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Text("${message[index]}"),
                          
                  ),
                  
                  
                );
              }),
          ),
          
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: messagectl,
                decoration: InputDecoration(
                  hintText: "Send Message",
                  suffixIcon: Container(
                    color: Colors.deepOrange,
                    child: IconButton(onPressed: sendMessage, icon: Icon(Icons.send,color: Colors.white,))),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    
                  ),
                  
                  fillColor: Colors.white,
                   
                  filled: true
                ),
              ),
          ),
        ],
      ),
    );
  }
}