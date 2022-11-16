import 'package:flutter/material.dart';
import 'package:statedigger/backend/tile.dart';
import 'package:statedigger/components/renderTile.dart';

import 'backend/tile.dart';
import 'backend/tile.dart';
import 'components/renderTile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adventures of the box',
      home: AppScreen(),
    );
  }
}

//stateful geymir stateið sitt.

class AppScreen extends StatefulWidget {
  Tile tile1 = Tile(false);
  Tile tile2 = Tile(true);
  Tile tile3 = Tile(false);
  Tile tile4 = Tile(true);

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  Color bckgColor = Colors.white;

  void changeColor(Color color){
    setState(() {
      bckgColor = color;
    });
  }

  void changeBlack(){
    setState(() {
      bckgColor = Colors.black;
    });

  }


  @override
  Widget build(BuildContext context) {
    RenderTile tile1 = RenderTile(widget.tile1, changeColor);
    RenderTile tile2 = RenderTile(widget.tile2, changeColor);
    RenderTile tile3 = RenderTile(widget.tile3, changeColor);
    RenderTile tile4 = RenderTile(widget.tile4, changeColor);

    tile1.hook = tile2.tile.newColor;
    tile2.hook = tile3.tile.newColor;
    tile3.hook = tile4.tile.newColor;
    tile4.hook = tile1.tile.newColor;

    return Scaffold(
      backgroundColor: bckgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                if(bckgColor == Colors.white){
                  bckgColor = Colors.orange;
                }else {
                  bckgColor = Colors.white;
                }
              });
              print('Background color change!');
            },
            child: Text('Change background color',
                style: TextStyle(color: Colors.black54)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              tile1,
              tile2,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              tile3,
              tile4,
            ],
          ),
          SizedBox(
            height: 25,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                widget.tile1.active=true;
                widget.tile2.active=true;
                widget.tile3.active=true;
                widget.tile4.active=true;


              });
              print('All tiles toggled to true!');
            },
            child: Text('Toggle all tiles',
                style: TextStyle(color: Colors.black54)),
          ),
        ],
      ),
    );
  }
}


