import 'common.dart';

class TicTacToe {
  // Add your attribute here.
  List<List<MarkTypes>> board = initBoard();

  List<MarkTypes> getRow(int row) {
    return board[row];
  }

  List<MarkTypes> getCol(int col) {
    List<MarkTypes> verticalRow = [];
    for (List<MarkTypes> row in board) {
      verticalRow.add(row[col]);
    }
    return verticalRow;
  }

  List<MarkTypes> getDiagonal(bool forward) {
    List<MarkTypes> diagonal = [];
    for (int idx = 0; idx < 3; idx++) {
      List<MarkTypes> row = board[idx];
      if (forward) {
        diagonal.add(row[idx]);
      } else {
        diagonal.add(row[board.length - idx - 1]);
      }
    }
    return diagonal;
  }

  void setX(int row, int col) {
    board[row][col] = MarkTypes.x;
  }

  void setO(int row, int col) {
    board[row][col] = MarkTypes.o;
  }

  void reset() {
    board = [
      [MarkTypes.e, MarkTypes.e, MarkTypes.e],
      [MarkTypes.e, MarkTypes.e, MarkTypes.e],
      [MarkTypes.e, MarkTypes.e, MarkTypes.e]
    ];
  }

  bool checkWin() {
    for (MarkTypes mark in [MarkTypes.x, MarkTypes.o]) {
      if (countMarker(getDiagonal(false), mark) == board.length) {
        return true;
      } else if (countMarker(getDiagonal(true), mark) == board.length) {
        return true;
      }
      for (int idx = 0; idx < board.length; idx++) {
        bool rowCondition = countMarker(getRow(idx), mark) == board.length;
        bool colCondition = countMarker(getCol(idx), mark) == board.length;
        if (rowCondition || colCondition) {
          return true;
        }
      }
    }
    return false;
  }

  void info() {
    String linspace = '-------------';
    print(linspace);
    for (List<MarkTypes> row in board) {
      print(rowToText(row));
      print(linspace);
    }
  }

  bool isFilled(int row, int col) {
    return board[row][col] != MarkTypes.e;
  }

  bool isFull() {
    for (List<MarkTypes> row in board) {
      for (MarkTypes mark in row) {
        if (mark == MarkTypes.e) {
          return false;
        }
      }
    }
    return true;
  }
}
