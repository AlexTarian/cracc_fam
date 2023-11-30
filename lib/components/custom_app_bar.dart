import 'package:flutter/material.dart';
import 'package:cracc_fam/main.dart';

class customAppBar extends StatelessWidget {
  const customAppBar({super.key,
    required this.onPressedL,
    required this.iconR,
    required this.onPressedR,
  });

  final VoidCallback onPressedL;
  final IconData iconR;
  final VoidCallback onPressedR;

  @override
  Widget build(BuildContext context) {

    return AppBar(
      toolbarHeight: 85.0,
      automaticallyImplyLeading: false,
      flexibleSpace: MyApp.aestheticMode ? Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[Colors.green, Colors.green, Colors.white, Colors.white, Colors.red, Colors.red],
            stops: <double>[0,0.33,0.34,0.65,0.66,1],
          ),
        ),
      ) : Container(),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Builder(
            builder: (context) => GestureDetector(
              onTap: onPressedL,
              child: const Icon(Icons.arrow_back,
                color: Colors.white,
                size: 45.0,
              ),
            ),
          ),
          GestureDetector(
            onTap: null,
            child: const Icon(Icons.flag,
              color: Colors.white,
              size: 60.0,
            ),
          ),
          GestureDetector(
            onTap: onPressedR,
            child: const Icon(Icons.question_mark,
              color: Colors.white,
              size: 45.0,
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}