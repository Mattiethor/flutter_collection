/*
  Create a class here called Engine that extends TicTacToe, this is our
  game-engine which will run our game.

  It needs a few things added.

  1.  Create an attribute called currentPlayer which is of type "MarkTypes".
      This attribute should be by default set to x.

  2.  Create a method called flipPlayer. It should simply flip the currentPlayer
      attribute from o->x or x->o

  3.  Create a method called getPos. This method should ask the user for
      a row position, column position and return the answers as a List<int>.

      This method should check if the board has already been filled at this
      position, if so, it should notify the user and ask again.

      Make sure to say something like "Player x, it's your turn!" (Use the
      currentPlayer attribute and the marker to text method)

  4.  Finally, a method called startGame. Implement the game now with everything
      you have at your disposal.
      HINT: checkWin, isFull, setMarker, info

 */
import 'dart:io';
import 'common.dart';
import 'tic_tac_toe.dart';

class Engine extends TicTacToe {
  MarkTypes currentPlayer = MarkTypes.x;

  void startGame() {
    info();
    while (true) {
      List<int> pos = getAction(currentPlayer);
      setMarker( pos[0], pos[1]);
      // Check for win condition
      if (checkWin()) {
        print('Player ${markToText(currentPlayer)} won!');
        info();
        break;
      } else if (isFull()) {
        print('Draw! Nobody wins!');
        break;
      } else {
        flipPlayer();
        info();
      }
    }
  }

  void flipPlayer() {
    if (currentPlayer == MarkTypes.x) {
      currentPlayer = MarkTypes.o;
    } else {
      currentPlayer = MarkTypes.x;
    }
  }

  List<int> getAction(MarkTypes mark) {
    print('Your turn player ${markToText(mark)}');
    int rowNbr;
    int colNbr;
    while (true) {
      stdout.write('\tEnter row number: ');
      rowNbr = int.parse(stdin.readLineSync());
      stdout.write('\tEnter column number: ');
      colNbr = int.parse(stdin.readLineSync());
      if (!isFilled(rowNbr, colNbr)) {
        break;
      } else {
        print('That position is already filled!');
      }
    }

    return [rowNbr, colNbr];
  }

  String getTile(int row, int col) {
    return markToText(board[row][col]);
  }

  void restart() {
    reset();
    currentPlayer = MarkTypes.x;
  }
  String getCurrentPlayer(){
    return markToText(currentPlayer);

  }

  void setMarker(int row, int col){
    board[row][col] = currentPlayer;



  }

}
