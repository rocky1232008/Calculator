import 'package:flutter/material.dart';

class secondScreen extends StatelessWidget {
  const secondScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hi im the second screen"),),
      body: Center(child: Text("Hello!"),),
    );
  }
}