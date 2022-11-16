import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSounds(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({int soundNumber, Color colorType}) {
    return Expanded(
      child: TextButton(

        style: TextButton.styleFrom(backgroundColor: colorType),
        onPressed: () {
          //creates audio player
          playSounds(soundNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(soundNumber: 1, colorType: Colors.red),
            buildKey(soundNumber: 2, colorType: Colors.orange),
            buildKey(soundNumber: 3, colorType: Colors.green),
            buildKey(soundNumber: 4, colorType: Colors.blue),
            buildKey(soundNumber: 5, colorType: Colors.purple),
            buildKey(soundNumber: 6, colorType: Colors.teal),
            buildKey(soundNumber: 7, colorType: Colors.yellow),
          ],
        ),
      ),
    ));
  }
}
