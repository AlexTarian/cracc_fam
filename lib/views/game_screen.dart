import 'package:flutter/material.dart';
import 'package:cracc_fam/components/custom_app_bar.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85.0),
        child: Builder(builder: (context) {
          return customAppBar(
            onPressedL: () {},
            iconR: Icons.help,
            onPressedR: () {},
          );
        }),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).primaryColorDark,
                  Theme.of(context).primaryColorLight,
                  Theme.of(context).scaffoldBackgroundColor,
                ],
              )),
          child: SafeArea(
            minimum: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20.0),
                Text('Round 1',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 50.0),

                const SizedBox(height: 30.0),

              ],
            ),
          ),
        ),
      ),
    );
  }
}