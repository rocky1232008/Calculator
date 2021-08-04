import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'second.dart';
import 'widgets/CalcButton.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var expression = '';
  var history = '';

  void AllClear(text){
    setState(() {
      expression = "";
      history = "";
    });
  }

  void clear(text){
    setState(() {
      expression = "";
    });
  }

  void numClick(text){
    setState(() {
      if(text != "x"){
        expression += text;
      }else{
        expression += "*";
      }
    });
  }

  void brain(text){
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm =ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      history = expression;
      expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF283637),
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => secondScreen()));
          }, icon: Icon(Icons.next_plan))
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
          children: [
            
            Container(alignment: Alignment.centerRight,child: Text(history.toString(), style: TextStyle(fontSize: 30,color: Colors.grey),), margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),),
            Container(alignment: Alignment.centerRight,child: Text(expression.toString(), style: TextStyle(fontSize: 50, color: Colors.white),),margin: EdgeInsets.only(bottom: 35, right: 10),),
            
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(child: "AC", Textcolor: Colors.blue, backgroundColor: Colors.white, onPressed: AllClear,),
              CalcButton(child: "C", Textcolor: Colors.blue, backgroundColor: Colors.white, onPressed: clear,),
              CalcButton(child: "%", Textcolor: Colors.blue, backgroundColor: Colors.white, onPressed: numClick),
              CalcButton(child: "/", Textcolor: Colors.blue, backgroundColor: Colors.white, onPressed: numClick),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(child: "1", Textcolor: Colors.white, backgroundColor: Colors.black87, onPressed: numClick),
              CalcButton(child: "2", Textcolor: Colors.white, backgroundColor: Colors.black87, onPressed: numClick),
              CalcButton(child: "3", Textcolor: Colors.white, backgroundColor: Colors.black87, onPressed: numClick),
              CalcButton(child: "x", Textcolor: Colors.blue, backgroundColor: Colors.white, onPressed: numClick),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(child: "4", Textcolor: Colors.white, backgroundColor: Colors.black87, onPressed: numClick),
              CalcButton(child: "5", Textcolor: Colors.white, backgroundColor: Colors.black87, onPressed: numClick),
              CalcButton(child: "6", Textcolor: Colors.white, backgroundColor: Colors.black87, onPressed: numClick),
              CalcButton(child: "+", Textcolor: Colors.blue, backgroundColor: Colors.white, onPressed: numClick),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(child: "7", Textcolor: Colors.white, backgroundColor: Colors.black87, onPressed: numClick),
              CalcButton(child: "8", Textcolor: Colors.white, backgroundColor: Colors.black87, onPressed: numClick),
              CalcButton(child: "9", Textcolor: Colors.white, backgroundColor: Colors.black87, onPressed: numClick),
              CalcButton(child: "-", Textcolor: Colors.blue, backgroundColor: Colors.white, onPressed: numClick),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(child: ".", Textcolor: Colors.white, backgroundColor: Colors.black87, onPressed: numClick),
              CalcButton(child: "0", Textcolor: Colors.white, backgroundColor: Colors.black87, onPressed: numClick),
              CalcButton(child: "00", Textcolor: Colors.white, backgroundColor: Colors.black87, onPressed: numClick),
              CalcButton(child: "=", Textcolor: Colors.white, backgroundColor: Colors.blue, onPressed: brain),
            ],
          )
            ],),
        ),
      )
    );
  }
}