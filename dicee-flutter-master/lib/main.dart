import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Dicee')),
          backgroundColor: Colors.red,
        ),
        //DicePage is stateless. supports hot reload.
        body: DicePage(),
      ),
    ),
  );
}
//Stateless widget. If you plan on the layout not changing you use a stateless widget

//Stateful widget. If you plan on the code changing.

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void diceRandom() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    //changed from container to Row. Rows can support multiple children.
    return Center(
      child: Row(
        //Remember to put , after every ). This helps navigate the code and make it more readable.
        children: <Widget>[
          //width can help with overflow but hardcoding code like this might make it incompatible with certain screen sizes or devices. See the expanded class.
          //width: 200.0,
          //The Expanded widget either fills out the vertical or horizontal available screen space depending if you use colom or row
          //flex allows you to control how much space you want a single Expended widget to take while still maintaining its screen space.
          //flex: 2,
          Expanded(
            child: FlatButton(
              onPressed: () {
                //Set rebuilds the interface again. so the lower var always starts at 1.
                setState(() {
                  diceRandom();
                });
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  diceRandom();
                });
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
