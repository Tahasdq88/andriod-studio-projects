import 'package:flutter/material.dart';

void main() {
  runApp(const ColumnPractice() );
}
class ColumnPractice extends StatelessWidget {
  const ColumnPractice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title:  Center(
            child:  const Text("column understanding"),
          ),
        ),
        body: Container(

          child:  Column(
                crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,

              key: key,
            children: [
              Text("gamer"),
              Text("gamer"),
              Text("gamer"),
              Text("gamer"),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children:[
                Text("gamer"),
                Text("gamer"),
                Text("gamer"),
]
              )
            ]
          ),
        ),
      ) ,
    );
  }
}

