import 'package:flutter/material.dart';
import 'package:grand_adventure/player/playerCharacter.dart';
import 'package:grand_adventure/widgets/widgets.dart';


//builds the bottom part of the UI. has the player stats and the button that calls for the next event

class BottomUi extends StatelessWidget {
  PlayerCharacter playerCharacter;
  Function middleAction;
  String buttonText;
  BottomUi({this.playerCharacter, this.middleAction, this.buttonText});


  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // Contains the player info.
        Container(
          width: 100,
          child: Text(
              playerCharacter.toString(),
              style: TextStyle(
                color: Colors.white,

              )),
        ),

        Container(
            width: 100,
            child: MyButton(
              buttonText: buttonText,
              onPressed: middleAction,
            )),
        SizedBox(
          width: 100,
        ),
      ],
    );
  }
}
