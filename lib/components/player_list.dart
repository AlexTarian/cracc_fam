import 'package:flutter/material.dart';
import 'package:cracc_fam/components/player.dart';

PlayerList quizEngine = PlayerList();

class PlayerList {

  List<Player> playerList = [
    Player(
        n: 'John',
        i: Icon(Icons.account_circle),
        p: Image(image: AssetImage('assets/images/john.jpeg')),
        t: 'A natural leader with a knack for strategy. His pure Italian blood grants him access to the ancient art of the one-card rule.  \n\n"It\'s definitely a rule!"',
        a: 'One-Card!',
    ),
    Player(
      n: 'Debbie',
      i: Icon(Icons.account_circle),
      p: Image(image: AssetImage('assets/images/debbie.jpeg')),
      t: 'Literally the nicest person in the world. But don\'t let that fool you. She can tear apart screen enclosures--and lightsabers--with her bare hands. \n\n"I\'m so sorry! I feel so bad about that!"',
      a: 'Sabre-Breaker',
    ),
    Player(
      n: 'Alex',
      i: Icon(Icons.account_circle),
      p: Image(image: AssetImage('assets/images/alex.jpeg')),
      t: 'A writer with obsessive-compulsive disorder. Years of playing Soulsborne games and foosball have honed his reflexes.\n\n"I\'m something of a Dex/Int build myself."',
      a: 'Parry-Riposte',
    ),
    Player(
      n: 'Corey',
      i: Icon(Icons.account_circle),
      p: Image(image: AssetImage('assets/images/corey.jpeg')),
      t: 'The only southerner who hates mayonnaise. Growing up on the mean streets of Spartanburg and traveling the world have given her insight into other cultures. \n\n"I put my hand up on your hip, when I dip, you dip, we dip."',
      a: 'Black Card',
    ),
    Player(
      n: 'Johnny',
      i: Icon(Icons.account_circle),
      p: Image(image: AssetImage('assets/images/johnny.jpeg')),
      t: 'A ninja with balanced skills. He can mix a drink better than you and beat you at Mario Kart.\n\n"There\'s water in milk and milk in water"',
      a: 'Secret Lies',
    ),
    Player(
      n: 'Emily',
      i: Icon(Icons.account_circle),
      p: Image(image: AssetImage('assets/images/emily.jpeg')),
      t: 'An artist with knowledge on an array of subjects. Her creative spark allows her to perceive more than most, giving her an uncanny intuition.\n\n"I\'ve got vibes."',
      a: 'Feel Vibes',
    ),
    Player(
      n: 'Ash',
      i: Icon(Icons.account_circle),
      p: Image(image: AssetImage('assets/images/ash.jpeg')),
      t: 'A musician with a heart of gold. Her friendly demeanor is a great cover for pranks. \n\n"I\'m a baker."',
      a: 'Prankster',
    ),
    Player(
      n: 'Matt',
      i: Icon(Icons.account_circle),
      p: Image(image: AssetImage('assets/images/matt.jpeg')),
      t: 'A fitness expert who enjoys board games. He can bench more than you and beat you at Catan. \n\n"May the Force be with you."',
      a: 'Bench Press',
    ),
    Player(
      n: 'Dano',
      i: Icon(Icons.account_circle),
      p: Image(image: AssetImage('assets/images/dan.jpeg')),
      t: 'A fiercely independent programmer. He\'s always seeking new challenges--partly to spite those who said it couldn\'t be done.\n\n"This isn\'t Vietnam, there are rules!"',
      a: 'Programmer',
    ),
  ];

  static final PlayerList _instance = PlayerList._internal();

  factory PlayerList() => _instance;

  PlayerList._internal();
}