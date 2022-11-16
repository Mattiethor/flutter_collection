import 'dart:math';

enum eColor { blue, yellow, red, green }

class Tile {
  bool active;
  eColor color;
  int _nextColor = -1;
  //is it active or not active ?
  Tile(this.active) {
    // When tile is new, a random color is created
    newColor();
  }

  // I use this to get new random color
  Random rnd = Random();


  //Toggle is a part of the Tile class
  void toggle() {
    // If toggle, then active is flipped
    active = !active;
  }

  void newColor() {
    // This ensures that the same color is not randomly chosen again
    while (true) {
      int testColor = rnd.nextInt(eColor.values.length);
      //If it not the same color as the current one.
      if (testColor != _nextColor) {
        _nextColor = testColor;
        break;
      }
    }
    color = eColor.values[_nextColor];
  }
}
