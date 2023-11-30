import 'package:flutter/material.dart';
import 'package:cracc_fam/components/player.dart';

PlayerList quizEngine = PlayerList();

class PlayerList {

  List<Player> playerList = [
    Player(
        n: 'Alex',
        i: Icon(Icons.account_circle),
        t: 'A writer with obsessive-compulsive disorder. Years of playing Soulsborne games and foosball have honed his reflexes.\n\n"I\'m something of a Dex/Int build myself."',
        a: 'Parry-Riposte',
    ),

  ];

  static final PlayerList _instance = PlayerList._internal();

  factory PlayerList() => _instance;

  PlayerList._internal();
}