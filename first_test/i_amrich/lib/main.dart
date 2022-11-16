import 'package:flutter/material.dart';

//the main function is the starting point for everything
void main() {
  runApp(
    // the blocks of your app. Includes the abilitty to change color and so forth
    MaterialApp(
      // Center puts the text or other widgets in the center of the app.
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          title: Text('Lute Orc'),
          backgroundColor: Colors.blueGrey,
        ),
        // Center puts the text or other widgets in the center of the app.
        //You can also
        //Body is the main part of the app. Everything below the appbar.
        body: Center(
          child: Image(
            image: AssetImage('Images/diamond.png'),
          ),
        ),
      ),
    ),
  );
}
