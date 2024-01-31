import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(
     const  MaterialApp(
        home:  MyCalculator()),
      );
}

class MyCalculator extends StatefulWidget {
  const MyCalculator({Key? key}) : super(key: key);

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  TextEditingController operator = TextEditingController();
  String ans = '';

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double txt = MediaQuery.textScaleFactorOf(context);
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              title: const Center(
            child: Text("My first calculator"),
          )),
          resizeToAvoidBottomInset: false,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
// /1st number
                  Container(
                    padding: EdgeInsets.all(10 * txt),
                    width: w * 0.35,
                    child: TextFormField(
                      cursorColor: Colors.teal,
                      controller: num1,
                      onChanged: (val) {
                        setState(() {
                          print(num1.text);
                          num1.text = val;
                          num1.selection = TextSelection.fromPosition(
                            TextPosition(offset: num1.text.length),
                          );
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '1st number',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
//Operator
                  Container(
                    padding: EdgeInsets.all(10 * txt),
                    width: w * 0.25,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      cursorColor: Colors.teal,
                      controller: operator,
                      onChanged: (val) {
                        setState(() {
                          operator.text = val;
                          operator.selection = TextSelection.fromPosition(
                            TextPosition(offset: operator.text.length),
                          );
                        });
                      },
                      decoration: InputDecoration(
                        hintText: '(+,-, etc)',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
//2nd number
                  Container(
                    padding: EdgeInsets.all(10 * txt),
                    width: w * 0.35,
                    child: TextFormField(
                      cursorColor: Colors.teal,
                      controller: num2,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        setState(() {
                          num2.text = val;
                          num2.selection = TextSelection.fromPosition(
                            TextPosition(offset: num2.text.length),
                          );
                        });
                      },
                      decoration: InputDecoration(
                          hintText: '2nd number',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                          )),
                    ),
                  ),
                ],
              ),

              Container(
                width: double.infinity,
                height: h * 0.4,
                child: Center(
                  child: Text(
                    ans == '' ? 'Your Answer will be displayed here' : ans,
                    style: TextStyle(
                      fontSize: ans == '' ? 16 * txt : 25 * txt,
                      color: ans == '' ? Colors.grey.shade400 : Colors.teal,
                    ),
                  ),
                ),
              ),
              //3rd child of Column() widget
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
//Calculate button
                  Container(
                    width: w * 0.4,
                    height: h * 0.08,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                      ),
                      onPressed: () {
                        ans = calc();
                        setState(() {});
                      },
                      child: Text(
                        'CALCULATE',
                      ),
                    ),
                  ),
//Clear button
                  Container(
                    width: w * 0.4,
                    height: h * 0.08,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                      ),
                      onPressed: () {
                        num1.clear();
                        operator.clear();
                        num2.clear();
                        ans = '';
                        setState(() {});
                      },
                      child: Text(
                        'CLEAR',
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),

    );
  }

  String calc() {
    Parser p = Parser();
    Expression e = p.parse('${num1.text + operator.text + num2.text}');
    ContextModel cm = ContextModel();
    num ans = e.evaluate(EvaluationType.REAL, cm);
    return ans.toString().length > 10
        ? ans.toStringAsPrecision(3)
        : ans.toString();
  }
}

// class MyCalculator   extends StatefulWidget {
//   // const ({Key? key}) : super(key: key);
//   //
//   @override
//   State<CalculatorState> createState() => CalculatorState();
// }
//
//
// class CalculatorState extends StatefulWidget {
//   const CalculatorState({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       home:
//     ) ;
//   }
// }
