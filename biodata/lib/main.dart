import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
         child: Center(
           child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[

              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/image/profileimg.jpg'),
              ),
              Text("Ahsan bhai", style: TextStyle(fontSize: 40,color: Colors.white),),
             Card(
               margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
               child: ListTile(
                 leading: Icon(
                   Icons.phone,color: Colors.teal,
                 ),
                 title: Text('0310-2572741',
                 style: TextStyle(
                   color:Colors.teal.shade900,
                   fontFamily: 'SourceSansPro',
                   fontSize: 20.0,
                 ),),
               )
             ),Card(
               margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
               child: ListTile(
                 leading: Icon(
                   Icons.email,color: Colors.teal,
                 ),
                 title: Text('Ahsanbhai@gmail.com',
                 style: TextStyle(
                   color:Colors.teal.shade900,
                   fontFamily: 'SourceSansPro',
                   fontSize: 20.0,
                 ),



                 ),
               )
             ),

              // Text("Text boxes"),
            ],
        ),
         ),
        ),
      ),
    );
  }
}
class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class  extends StatefulWidget {
  const ({Key? key}) : super(key: key);

  @override
  State<> createState() => _State();
}

class _State extends State<> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
