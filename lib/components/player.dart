import 'package:flutter/material.dart';

class Player {
  late String name;
  late Icon icon;
  late Image image;
  late String text;
  late String ability;
  late Color color;

  Player({n, i, p, t, a, c}) {
    name = n;
    icon = i;
    image = p;
    text = t;
    ability = a;
    color = c;
  }
}