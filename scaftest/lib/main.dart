import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Center(
            child: Text('Test app'),
          ),
        ),
        body: SafeArea(
          child: Column(
            children:<Widget> [
              Text('Column 1'),



            ],
          ),
        ),
      ),


    );
  }
}
