import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grand_adventure/components/components.dart';
import 'package:grand_adventure/encounters/specialEncounter.dart';
import 'package:grand_adventure/functions/dice.dart';
import 'package:grand_adventure/widgets/widgets.dart';
import 'player/playerCharacter.dart';
import 'monsters/monsterGenerator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Game',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Grand Adventure'),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: MainGame(),
        ),
      ),
    );
  }
}

class MainGame extends StatefulWidget {
  @override
  _MainGameState createState() => _MainGameState();
}

PlayerCharacter playerCharacter = new PlayerCharacter();
MonsterGenerator monsterGenerator = new MonsterGenerator();
SpecialEncounter specialEncounter = new SpecialEncounter();

class _MainGameState extends State<MainGame> {
  //Main game functions and variables
  String middleText = specialEncounter.getEncounter(0);
  String combatLog = '';
  int monsterHealth = 0;
  String actionText = '';
  String continueText = 'start';
  String monsterImage = specialEncounter.getImage(0);
  int diceNumber;
  String bottomButtonTextOne = '';
  String bottomButtonTextTwo = '';
  int gameCounter = 0;

  //Use together with playerDeath() to reset the game and show the game over screen
  bool checkDeath() {
    if (playerCharacter.getHealth() <= 0) {
      return true;
    } else {
      return false;
    }
  }

  void playerDeath() {
    setState(() {
      middleText = specialEncounter.getEncounter(1);
      monsterImage = specialEncounter.getImage(1);
      playerCharacter.reset();
      gameCounter = 0;
      playerCharacter.health = 100;
      combatLog = '';
      actionText = '';
      continueText = 'try again';
      monsterGenerator.resetMonsters();
    });
  }

  //Used when the player takes damage from monster. it is the monster damage - the players armor.
  //If the monster damage is less than zero it will put it at 0
  void playerHealthAction() {
    int monsterDamage =
        monsterGenerator.getDamage() - playerCharacter.getArmor();
    if (monsterDamage < 0) {
      monsterDamage = 0;
    }
    setState(() {
      playerCharacter.health = playerCharacter.health - monsterDamage;
    });
  }

  //Used with bottom button 1 to see which option the player chose.
  void playerRewardOne() {
    setState(() {
      playerCharacter.userReward(1);
      continueText = 'Continue';
      bottomButtonTextOne = '';
      bottomButtonTextTwo = '';
    });
  }

//Used with bottom button 2 to see which option the player chose.
  void playerRewardTwo() {
    setState(() {
      playerCharacter.userReward(2);
      continueText = 'Continue';
      bottomButtonTextOne = '';
      bottomButtonTextTwo = '';
    });
  }

  //Combat system. It checks the players health at the end.
  void combatRoll() {
    setState(() {
      print(monsterHealth);
      int diceNumber = playerCharacter.damage + diceRoll(4);
      monsterGenerator.damageMonster(diceNumber);
      combatLog = 'You attack for $diceNumber !';
      middleText =
          'The monster attacks you for ${monsterGenerator.getDamage() - playerCharacter.armor}';
      playerHealthAction();
      monsterHealth = monsterGenerator.getHealth();
      print(monsterHealth);
      if (playerCharacter.health <= 0 && monsterHealth <= 0) {
        playerDeath();
      } else if (monsterHealth <= 0) {
        middleText = 'you win !';
        actionText = '';
        continueText = 'Continue';
        playerCharacter.gold += 10 + diceRoll(4) + 5;
        combatLog = 'you get some gold';
      } else if (checkDeath() == true) {
        actionText = '';
        continueText = '';
        combatLog = '';
        playerDeath();
      }
    });
  }

  //used to change the text of the bottom buttons.
  void socialRoll() {
    bottomButtonTextOne = playerCharacter.getChoiceOne();
    bottomButtonTextTwo = playerCharacter.getChoiceTwo();
  }

  //Checks if the encounter is a social encounter or a combat encounter
  void nextEncounter() {
    setState(() {
      monsterGenerator.resetMonsters();
      //diceroll decides if the player gets a combat encounter or a social encounter
      diceNumber = diceRoll(5);
      print('diceroll $diceNumber');
      gameCounter++;

      //check if it is game over and resets the stats the game counter.
      if (checkDeath() == true) {
        playerDeath();
        //Event that plays out if the player goes below 0 gold
      } else if (playerCharacter.gold < 0) {
        playerCharacter.setEncounterPoor();
        middleText = playerCharacter.getEncounter();
        //checks gameCounter. if it is 10 the boss will appear
      } else if (gameCounter == 10) {
        middleText = specialEncounter.getEncounter(2);
        monsterImage = specialEncounter.getImage(2);
        combatLog = '';
        //boss fight starts
      } else if (gameCounter == 11) {
        continueText = '';
        actionText = 'Attack';
        monsterGenerator.setBossMonster();
        middleText = 'You encounter a Dragon!';
        monsterHealth = monsterGenerator.getHealth();
        monsterImage = monsterGenerator.getImages();
        //Victory screen
      } else if (gameCounter == 12) {
        middleText = specialEncounter.getEncounter(3);
        monsterImage = specialEncounter.getImage(3);
        combatLog = '';
        continueText = 'Play again';
        monsterGenerator.resetMonsters();
        playerCharacter.reset();
        gameCounter = 0;
        //monster encounter
      } else if (diceNumber <= 1) {
        monsterGenerator.nextMonster();
        combatLog = '';
        continueText = '';
        actionText = 'Attack';
        middleText = 'You encounter a ${monsterGenerator.getName()}!';
        monsterHealth = monsterGenerator.getHealth();
        monsterImage = monsterGenerator.getImages();
        //Social encounter
      } else if (diceNumber > 1) {
        continueText = '';
        combatLog = '';
        actionText = '';
        playerCharacter.nextEncounter();
        middleText = playerCharacter.getEncounter();
        monsterImage = playerCharacter.getImage();
        socialRoll();
      }
    });
  }

  //Main UI
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Column(
          children: <Widget>[
            Divider(
              thickness: 3,
              color: Colors.white,
            ),
            //shows the gameCounter as days
            Text(
              'Day:$gameCounter',
              style: TextStyle(color: Colors.white, fontSize: 16.5),
            ),
            SizedBox(
              height: 80,
            ),
            //displays the monster image(can also be a social event image)
            Container(
                height: 200, width: 200, child: Image.asset(monsterImage)),
            Expanded(
              flex: 3,
              child: Center(
                  child: Text(
                //displays the text in the middle of the screen
                '$middleText',
                style: TextStyle(color: Colors.white, fontSize: 16.7),
              )),
            ),
            Text(
              //tells the player how much the monster is hitting for
              '$combatLog',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            MyButton(buttonText: actionText, onPressed: combatRoll),

            //Player stats and bottom UI
            BottomUi(
                playerCharacter: playerCharacter,
                middleAction: nextEncounter,
                buttonText: continueText),
            Divider(
              thickness: 3,
              color: Colors.white,
            ),
            SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //The buttons in widgets/myButton.dart are dynamic. if there is no text they will not be intractable.
                  Flexible(
                    flex: 1,
                    child: MyButton(
                      buttonText: bottomButtonTextOne,
                      onPressed: playerRewardOne,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: MyButton(
                      buttonText: bottomButtonTextTwo,
                      onPressed: playerRewardTwo,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
