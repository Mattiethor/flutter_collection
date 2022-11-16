import 'dart:math';


//a simple dice function. Can be used with any number.
int diceRoll(int userNumber){
  Random random = new Random();
  int number;

  number = random.nextInt(userNumber);

  return number;

}