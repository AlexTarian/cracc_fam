import 'package:flutter/material.dart';

class Player {
  late String name;
  late Icon icon;
  late String text;
  late String ability;

  Player({n, i, t, a}) {
    name = n;
    icon = i;
    text = t;
    ability = a;
  }
}