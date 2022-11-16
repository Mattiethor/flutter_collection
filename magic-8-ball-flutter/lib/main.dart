import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(new BallPage());
}

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Center(
            child: Text('Magic 8 ball'),
          ),
        ),
        body: BallNumber(),
      ),
    );
  }
}

class BallNumber extends StatefulWidget {
  @override
  _BallNumberState createState() => _BallNumberState();
}

class _BallNumberState extends State<BallNumber> {
  int ballNumber = 1;

  void ballRandom() {
    ballNumber = Random().nextInt(5) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  ballRandom();
                });
              },
              child: Image.asset('images/ball$ballNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
