import 'package:cracc_fam/components/my_flutter_app_icons.dart';
import 'package:cracc_fam/main.dart';
import 'package:flutter/material.dart';
import 'package:cracc_fam/components/custom_app_bar.dart';
import 'package:cracc_fam/components/icon_box_button.dart';
import 'package:cracc_fam/views/player_select_screen.dart';
import 'package:cracc_fam/views/settings_screen.dart';
import 'package:cracc_fam/components/my_flutter_app_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                Text('CRACCHI-YOLO',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 50.0),
                GestureDetector(
                  child: const IconBoxButton(
                    icon: Icons.gamepad_rounded,
                    text: 'New Game',
                  ),
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PlayerSelectScreen()));
                  },
                ),
                const SizedBox(height: 30.0),
                GestureDetector(
                  child: const IconBoxButton(
                    icon: Icons.settings,
                    text: 'Settings',
                  ),
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
                  },
                ),
                const SizedBox(height: 30.0),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
