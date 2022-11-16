import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:grand_adventure/functions/dice.dart';
import 'package:grand_adventure/functions/dice.dart';
import 'monster.dart';

// A list of monsters that appear in the game

class MonsterGenerator {
  List<Monster> _monsterStats;

  MonsterGenerator() {
    generateMonsters();
  }

  void generateMonsters() {
    _monsterStats = [
      Monster(name: 'Orc', health: 15, damage: 7, enemyImage: 'images/orc.png'),
      Monster(
          name: 'Ogre', health: 24, damage: 6, enemyImage: 'images/ogre.png'),
      Monster(
          name: 'Giant Snake',
          health: 10,
          damage: 5,
          enemyImage: 'images/giantSnake.png'),
      Monster(
          name: 'Slime', health: 20, damage: 7, enemyImage: 'images/cube.png'),
      Monster(
          name: 'Giant Rat',
          health: 10,
          damage: 5,
          enemyImage: 'images/rat.png'),
      Monster(
          name: 'Skeleton',
          health: 25,
          damage: 8,
          enemyImage: 'images/skeleton.png'),
      //the dragon has to be on the bottom of the list for the getBoss function to work
      Monster(
          name: 'Dragon',
          health: 80,
          damage: 15,
          enemyImage: 'images/dragon.png'),
    ];
  }

  int monsterNumber = 0;

  String getName() {
    return _monsterStats[monsterNumber].name;
  }

  int getHealth() {
    return _monsterStats[monsterNumber].health;
  }

  int getDamage() {
    return _monsterStats[monsterNumber].damage;
  }

  void damageMonster(int dmg) {
    _monsterStats[monsterNumber].health =
        _monsterStats[monsterNumber].health - dmg;
  }

  String getImages() {
    return _monsterStats[monsterNumber].enemyImage;
  }

  void nextMonster() {
    monsterNumber = diceRoll(_monsterStats.length - 1);
    print('this is monster $monsterNumber');
  }

  //used to get access to the dragon boss
  void setBossMonster() {
    monsterNumber = _monsterStats.length - 1;
  }

  void resetMonsters() {
    generateMonsters();
  }
}
