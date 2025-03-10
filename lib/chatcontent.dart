import 'package:flutter/material.dart';
import 'package:project_internship/person.dart';
//import 'package:project_internship/personcontent.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    List name=["John Quil","Ginger Plant","Cherry Blossom","Rose Bush","Frank N. Stein","Pat Thettick","Percy kewshun"];
    List image=["assets/Ellipse 6.png","assets/Ellipse 6 (1).png","assets/Ellipse 6 (2).png","assets/Ellipse 6 (4).png","assets/Ellipse 6 (5).png","assets/Ellipse 6 (6).png","assets/Ellipse 6 (7).png"];
    return Scaffold(backgroundColor: const Color.fromARGB(255, 203, 202, 202),
      body: ListView.builder(

        itemCount: name.length,
        itemBuilder: (BuildContext,index){
        return Padding(
          padding: EdgeInsets.only(bottom: 1,top: 4),
          child: Container(
            color: Colors.white,
            child: 
          ListTile(
            
            // contentPadding: EdgeInsets.all(1),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Person(nam: name[index],images: image[index],)));},
              leading: CircleAvatar(backgroundImage: AssetImage("${image[index]}"),),
              title: Text("${name[index]}"),
              subtitle: Text("Lorem Ipsum is simply"),
              trailing: Text("Mar 31"),
            
                ),
      
        ));
      
      }),
    );
  }
}