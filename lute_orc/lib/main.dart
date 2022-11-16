import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black12,
        body: Center(
          child: Image(
            //See pubspec.yaml for adding assets.
            image: AssetImage('images/orcLute.png'),
          ),
        ),
        appBar: AppBar(
          title: Center(
            //Use alt enter to get short-cuts
            child: Text('Lute Orc is not poor' ),
          ),
          backgroundColor: Colors.lightBlue[900],
        ),
      ),
    ),
  );
}
