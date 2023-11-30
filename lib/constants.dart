import 'package:flutter/material.dart';
import 'main.dart';

const Color italyGreen = Color(0xFF008C45);
const Color italyRed = Color(0xFFCD212A);
const Color themeColor = Color(0xFF354962);
final Color headerOne = MyApp.aestheticMode ? const Color(0xFF008C45) : const Color(0xFF5b9bd5);
final Color headerTwo = MyApp.aestheticMode ? const Color(0xFFf4f9ff) : const Color(0xFF5b9bd5);
final Color headerThree = MyApp.aestheticMode ? const Color(0xFFCD212A) : const Color(0xFF5b9bd5);
const Color themeTextColor = Colors.white;
const TextStyle chalk = TextStyle(color: Color(0xFFCED8F7),fontFamily: 'Italiana');
const TextStyle labelText = TextStyle(color: Color(0xFFCED8F7),fontFamily: 'Italiana',fontSize: 24.0);

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFFbbcedc),
  primarySwatch: customPrimaryColor,
  appBarTheme: const AppBarTheme(color: italyRed),
  primaryColor: const Color(0xFFCD212A),
  primaryColorLight: const Color(0xFFf4f9ff),
  primaryColorDark: const Color(0xFFf4f9ff),
  splashColor: italyGreen,
  fontFamily: 'Italiana',
  dialogBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Italiana',
      color: Color(0xFFCD212A),
      fontSize: 50,
      fontWeight: FontWeight.w900,
    ),
    titleLarge:  TextStyle(
      fontFamily: 'Italiana',
      color: Color(0xFFCD212A),
      fontSize: 40,
      fontWeight: FontWeight.w900,
    ),
    titleMedium:  TextStyle(
      fontFamily: 'Italiana',
      color: Color(0xFFCD212A),
      fontSize: 30,
      fontWeight: FontWeight.w900,
    ),
    bodyLarge:  TextStyle(
      fontFamily: 'Italiana',
      color: Colors.black,
      fontSize: 35,
      fontWeight: FontWeight.w700,
    ),
    bodyMedium:  TextStyle(
      fontFamily: 'Italiana',
      color: Colors.black,
      fontSize: 25,
      fontWeight: FontWeight.w700,
    ),
    displaySmall:  TextStyle(
      fontFamily: 'Italiana',
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w700,
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF222222),
  primarySwatch: customAccentColor,
  appBarTheme: AppBarTheme(color: Color(0xff00778f)),
  primaryColor: const Color(0xFF01bbd0),
  primaryColorLight: Color(0xff004157).withOpacity(0.5),
  primaryColorDark: Color(0xff004157).withOpacity(0.5),
  splashColor: const Color(0xFF327087),
  fontFamily: 'Italiana',
  brightness: Brightness.dark,
  dialogBackgroundColor: const Color(0xFFffffff),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Italiana',
      color: Color(0xFF01bbd0),
      fontSize: 50,
      fontWeight: FontWeight.w900,
    ),
    titleLarge:  TextStyle(
      fontFamily: 'Italiana',
      color: Color(0xFF01bbd0),
      fontSize: 40,
      fontWeight: FontWeight.w900,
    ),
    titleMedium:  TextStyle(
      fontFamily: 'Italiana',
      color: Color(0xFF01bbd0),
      fontSize: 30,
      fontWeight: FontWeight.w900,
    ),
    bodyLarge:  TextStyle(
      fontFamily: 'Italiana',
      color: Colors.white,
      fontSize: 35,
      fontWeight: FontWeight.w700,
    ),
    bodyMedium:  TextStyle(
      fontFamily: 'Italiana',
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.w700,
    ),
    displaySmall:  TextStyle(
      fontFamily: 'Italiana',
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w700,
    ),
  ),
);

Map<int, Color> primaryColorCodes =
{
  50:const Color.fromRGBO(0,140,69, .1),
  100:const Color.fromRGBO(0,140,69, .2),
  200:const Color.fromRGBO(0,140,69, .3),
  300:const Color.fromRGBO(0,140,69, .4),
  400:const Color.fromRGBO(0,140,69, .5),
  500:const Color.fromRGBO(0,140,69, .6),
  600:const Color.fromRGBO(0,140,69, .7),
  700:const Color.fromRGBO(0,140,69, .8),
  800:const Color.fromRGBO(0,140,69, .9),
  900:const Color.fromRGBO(0,140,69, 1),
};

MaterialColor customPrimaryColor = MaterialColor(0xFF008C45, primaryColorCodes);

Map<int, Color> accentColorCodes =
{
  50:const Color.fromRGBO(49, 64, 95, .1),
  100:const Color.fromRGBO(49, 64, 95, .2),
  200:const Color.fromRGBO(49, 64, 95, .3),
  300:const Color.fromRGBO(49, 64, 95, .4),
  400:const Color.fromRGBO(49, 64, 95, .5),
  500:const Color.fromRGBO(49, 64, 95, .6),
  600:const Color.fromRGBO(49, 64, 95, .7),
  700:const Color.fromRGBO(49, 64, 95, .8),
  800:const Color.fromRGBO(49, 64, 95, .9),
  900:const Color.fromRGBO(49, 64, 95, 1),
};

MaterialColor customAccentColor = MaterialColor(0xFF31405f, primaryColorCodes);