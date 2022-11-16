import 'package:flutter/material.dart';
import 'package:statedigger/backend/tile.dart';


//uses the backend to render a tile.

class RenderTile extends StatefulWidget {
  Tile tile;
  Function hook;

  Function changeParent;
  //uses a tile as a input(from backend)
  RenderTile(this.tile, this.changeParent);

  @override
  _RenderTileState createState() => _RenderTileState();
}

class _RenderTileState extends State<RenderTile> {
  Color getColor() {
    if (widget.tile.color == eColor.blue) {
      return Colors.blue;
    } else if (widget.tile.color == eColor.red) {
      return Colors.red;
    } else if (widget.tile.color == eColor.yellow) {
      return Colors.yellow;
    } else if (widget.tile.color == eColor.green) {
      return Colors.green;
    }
  }

  void changeColor(){
    setState(() {
      widget.tile.newColor( );
    });
  }

  void activateHook(){
    setState(() {
      widget.hook();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          widget.tile.toggle();
          widget.changeParent(getColor());
          activateHook();
        });
        print('Tile Clicked!');
      },
      style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 0))),
      child: Container(
        child: widget.tile.active ? Icon(Icons.check, color: Colors.black54) : Icon(Icons.adb_outlined, color: Colors.black54),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey),
          color: getColor(),
        ),
        height: 100,
        width: 100,
      ),
    );
  }
}
