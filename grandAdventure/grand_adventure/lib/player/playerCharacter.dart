import 'package:grand_adventure/functions/dice.dart';
import 'package:grand_adventure/main.dart';
import 'package:grand_adventure/encounters/encounter.dart';


class PlayerCharacter {
  int health = 100;
  int damage = 10;
  String firstName = 'Hero';
  int armor = 1;
  int gold = 10;
  int encounterNumber = 0;

  PlayerCharacter();

  //PlayerCharacter stats. encounters and damage from monsters will affect them.
  //See encounters below and monsters in monsters/monsterGenerator.dart

  String getName() {
    return playerCharacter.firstName;
  }

  int getHealth() {
    return playerCharacter.health;
  }

  int getDamage() {
    return playerCharacter.damage;
  }

  int getArmor() {
    return playerCharacter.armor;
  }

  int getGold() {
    return playerCharacter.gold;
  }


  //used in components/bottomUi.dart to print out the player status on screen

  //TODO add icons instead of text.
  @override
  String toString() {
    return '${this.firstName}\nHP: '
        '${this.health}'
        '\nArmor: ${this.armor}'
        '\nDamage: ${this.damage}'
        '\nGold: ${this.gold} ';
  }


  //encounters the player can come across
  //uses the encounter from encounters/encounter.dart.
  //Located here to easily affect the playerCharacter stats.
  //see parent in encounters/encounter.dart

  List<Encounter> _encounterGenerator = [
    Encounter(
        encounter:
            'You encounter a caravan of merchants. They warn you of the road a head and offer you to buy some of their wares ',
        image: 'images/wagon.png',
        choiceOne: 'New armor.\n- 10 gold + 5 armor',
        choiceTwo: 'A healing potion.\n - 10 gold + 30 HP'),
    Encounter(
        encounter:
            'You spot a strange stone altar in the forest. As you draw closer a voice echos in your head: Offer me your blood and i will make you strong, refuse and i will make you weak.',
        image: 'images/stone.png',
        choiceOne: 'Offer your blood.\n-15 health + 5 Damage',
        choiceTwo: 'Refuse and leave.\n-5 damage'),
    Encounter(
        encounter: 'You enter a small town and encounter a blacksmith',
        image: 'images/anvil.png',
        choiceOne: 'Buy a new sword.\n+5 damage -10 gold',
        choiceTwo: 'You sell some loot.\n+10 gold '),
    Encounter(
        encounter: 'You stop and rest for the day',
        image: 'images/fire.png',
        choiceOne: 'Tend to your wounds.\n+20 HP',
        choiceTwo: 'Train your swordsmanship.\n+ 10 damage'),
    Encounter(
        encounter:
            'You come to a bridge and some bandits stop you. They say "Pay the toll or die !',
        image: 'images/bridge.png',
        choiceOne: 'You pay the toll.\n 20 gold',
        choiceTwo: 'You fight the bandits !\n-20 HP'),
    Encounter(
        encounter: 'You come across a merchant cart stuck in some mud',
        image: 'images/wagon.png',
        choiceOne: 'You help push the cart free. +50 gold',
        choiceTwo: 'You rob the wagon and ake some supplies. +20 HP '),
    Encounter(
        encounter:
            'You come across a large river. A ferryman offers to row you across for a price',
        image: 'images/river.png',
        choiceOne: 'You pay the man -30 gold  to get you across.\n-30 gold',
        choiceTwo: 'You take the long way around.\n-10 health'),
    Encounter(
        encounter:
            'You have run out of money. As your supplies dwindle you are forced to sell some of your supplies to survive\n-50 HP + 50 gold')
  ];

  String getEncounter() {
    return _encounterGenerator[encounterNumber].encounter;
  }

  String getChoiceOne() {
    return _encounterGenerator[encounterNumber].choiceOne;
  }

  String getChoiceTwo() {
    return _encounterGenerator[encounterNumber].choiceTwo;
  }

  String getImage() {
    return _encounterGenerator[encounterNumber].image;
  }

  //Chooses a random encounter from the list to act out
  void nextEncounter() {
    encounterNumber = diceRoll(_encounterGenerator.length - 1);
    print('this is  encounter$encounterNumber');
  }

  //plays when the player runs out of money
  void setEncounterPoor() {
    encounterNumber = _encounterGenerator.length - 1;
    this.gold = 50;
    this.health -= 50;
  }

  void reset() {
    this.health = 100;
    this.damage = 10;
    this.firstName = 'Hero';
    this.armor = 1;
    this.gold = 10;
  }

  //the player cannot go above 100 hp
  void checkHealth() {
    if (this.health > 100) {
      this.health = 100;
    }
  }

  //this checks the choices the player makes  and sees what the player gains of loses
  void userReward(int userChoice) {
    //encounter [0] 'Merchant caravan'
    if (encounterNumber == 0 && userChoice == 1) {
      this.gold -= 10;
      this.armor += 5;
    } else if (encounterNumber == 0 && userChoice == 2) {
      this.gold -= 10;
      this.health += 30;
      checkHealth();
      //encounter [1] 'Stone Altar',
    } else if (encounterNumber == 1 && userChoice == 1) {
      this.health -= 15;
      this.damage += 5;
      checkHealth();
    } else if (encounterNumber == 1 && userChoice == 2) {
      this.damage -= 5;
      //encounter [2] 'Blacksmith,
    } else if (encounterNumber == 2 && userChoice == 1) {
      this.damage += 5;
      this.gold -= 10;
    } else if (encounterNumber == 2 && userChoice == 2) {
      this.gold += 10;
      //encounter [3] 'Camp'
    } else if (encounterNumber == 3 && userChoice == 1) {
      this.health += 20;
      checkHealth();
    } else if (encounterNumber == 3 && userChoice == 2) {
      this.damage += 10;
      //encounter [4] 'Bandits'
    } else if (encounterNumber == 4 && userChoice == 1) {
      this.gold -= 20;
    } else if (encounterNumber == 4 && userChoice == 2) {
      this.health -= 20;
      checkHealth();
      //encounter[5]'Stuck cart'
    } else if (encounterNumber == 5 && userChoice == 1) {
      this.gold += 50;
    } else if (encounterNumber == 5 && userChoice == 2) {
      this.health += 20;
      checkHealth();
    } //encounter[6] 'River'
    else if (encounterNumber == 6 && userChoice == 1) {
      this.gold -= 30;
    } else if (encounterNumber == 6 && userChoice == 2) {
      this.health -= 10;
      checkHealth();
    }
  }
}
