import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game/common.dart';
import 'package:tic_tac_toe/game/tic_tac_toe.dart';

import 'game/engine.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GameWidget(title: 'Tic Tac Toe'),
    );
  }
}

class GameWidget extends StatefulWidget {
  GameWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  String infoText = '';
  Engine gameEngine = Engine();
  void setInfoText(String info) {
    setState(() {
      infoText = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(infoText),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GameTile(
                color: Colors.red,
                position: [0, 0],
                setInfoText: setInfoText,
                gameEngine: gameEngine,
              ),
              GameTile(
                color: Colors.grey,
                position: [0, 1],
                setInfoText: setInfoText,
                gameEngine: gameEngine,
              ),
              GameTile(
                color: Colors.brown,
                position: [0, 2],
                setInfoText: setInfoText,
                gameEngine: gameEngine,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GameTile(
                color: Colors.blue,
                position: [1, 0],
                setInfoText: setInfoText,
                gameEngine: gameEngine,
              ),
              GameTile(
                color: Colors.green,
                position: [1, 1],
                setInfoText: setInfoText,
                gameEngine: gameEngine,
              ),
              GameTile(
                color: Colors.purple,
                position: [1, 2],
                setInfoText: setInfoText,
                gameEngine: gameEngine,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GameTile(
                color: Colors.green,
                position: [2, 0],
                setInfoText: setInfoText,
                gameEngine: gameEngine,
              ),
              GameTile(
                color: Colors.yellow,
                position: [2, 1],
                setInfoText: setInfoText,
                gameEngine: gameEngine,
              ),
              GameTile(
                color: Colors.orange,
                position: [2, 2],
                setInfoText: setInfoText,
                gameEngine: gameEngine,
              ),
            ],
          ),
          SizedBox(
            width: 100,
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        gameEngine.restart();
                        infoText = 'player X  start the game';
                      });
                    },
                    child: Text('reset'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GameTile extends StatefulWidget {
  Color color;
  List<int> position;
  Function setInfoText;
  Engine gameEngine;

  // THE CONSTRUCTOR! MAW GAWD!
  GameTile(
      {Key key,
      this.color,
      @required this.position,
      @required this.setInfoText,
      @required this.gameEngine})
      : super(key: key);

  @override
  _GameTileState createState() => _GameTileState();
}

class _GameTileState extends State<GameTile> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        setState(() {
          if (!widget.gameEngine
              .isFilled(widget.position[0], widget.position[1])) {
            widget.gameEngine.setMarker(widget.position[0], widget.position[1]);

            if (widget.gameEngine.checkWin()) {
              widget.setInfoText(
                  'player ${widget.gameEngine.getCurrentPlayer()} WON');
            } else if (widget.gameEngine.isFull()) {
              widget.setInfoText('DRAW');
            } else {
              widget.gameEngine.getTile(widget.position[0], widget.position[1]);

              widget.gameEngine.flipPlayer();
              widget.setInfoText(
                  'player ${widget.gameEngine.getCurrentPlayer()} it is your turn');
            }
          }
        });
      },
      child: Container(
        child: Center(
            child: Text(widget.gameEngine
                .getTile(widget.position[0], widget.position[1]))),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: widget.color,
        ),
      ),
    );
  }
}
