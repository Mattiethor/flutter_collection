import 'package:grand_adventure/encounters/encounter.dart';

//special encounters are used at certain points in the game.
class SpecialEncounter {
  List<Encounter> _specialGenerator = [

    //When you first start the game for the first time.
    Encounter(
        encounter:
            'Welcome to the Grand Adventure !\nYou, a lone adventurer , have taken it upon yourself to vanquishing a great dragon that has been terrifying the land. It is a 10 day journey to the lair.',
        image: 'images/forest.png'),
    //When the player dies(Health goes to or below 0)
    Encounter(
        encounter: 'You have fallen in battle and evil has triumphed',
        image: 'images/grave.png'),
    //When the game counter reaches 10
    Encounter(
        encounter:
            'You finally make it to the dragons lair. You hear the beating of wings and a thunderous roar. The beast comes... prepare yourself ! ',
        image: 'images/lair.png'),
    //when the gamecounter reaches 12
    Encounter(
        encounter:
            'You stand above the corpse of your fallen foe...battered and bruised but alive! You gather yourself, check your belongings and start heading towards your next adventure\n\nThanks for playing ',
        image: 'images/dragonSkull.png')
  ];

  String getEncounter(int number) {
    return _specialGenerator[number].encounter;
  }

  String getImage(int number) {
    return _specialGenerator[number].image;
  }
}
