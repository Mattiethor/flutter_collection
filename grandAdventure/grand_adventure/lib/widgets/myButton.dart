
import 'package:flutter/material.dart';


// a button widget. used to get choices and combat actions from the player
class MyButton extends StatelessWidget {
  Function onPressed;
  String buttonText;

  MyButton({this.buttonText, this.onPressed=null}){
    if(onPressed == null){
      onPressed = () {};
    }
  }

  @override
  Widget build(BuildContext context) {
    //this checks if the button is active or not. if there is no text '' the player cannot interact with the button
    return  buttonText == '' ? Container() : TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white10),
      ),
      onPressed: () {
        onPressed();
      },
      child: Text(buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.5
          )),
    );
  }
}
