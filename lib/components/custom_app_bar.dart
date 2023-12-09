import 'package:cracc_fam/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cracc_fam/main.dart';

class customAppBar extends StatelessWidget {
  const customAppBar({super.key,
    this.isBackDisabled = false,
    required this.onPressedL,
    this.isButtonRDisabled = false,
    required this.iconR,
    required this.onPressedR,
  });

  final bool isBackDisabled;
  final VoidCallback onPressedL;
  final bool isButtonRDisabled;
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
              onTap: isBackDisabled ? null : onPressedL,
              child: Icon(Icons.arrow_back,
                color: isBackDisabled ? Colors.transparent : Colors.white,
                size: 45.0,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));},
            child: const Icon(Icons.flag,
              color: Colors.white,
              size: 60.0,
            ),
          ),
          GestureDetector(
            onTap: isBackDisabled ? null : onPressedR,
            child: Icon(Icons.question_mark,
              color: isBackDisabled ? Colors.transparent : Colors.white,
              size: 45.0,
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}