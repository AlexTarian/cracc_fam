import 'package:cracc_fam/views/game_screen.dart';
import 'package:cracc_fam/views/host_join_screen.dart';
import 'package:flutter/material.dart';
import 'package:cracc_fam/components/custom_app_bar.dart';

class LobbyScreen extends StatefulWidget {
  const LobbyScreen({Key? key, required this.type, required this.player, required this.points, required this.character}) : super(key: key);

  final String type;
  final String player;
  final int points;
  final String character;

  @override
  State<LobbyScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends State<LobbyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85.0),
        child: Builder(builder: (context) {
          return customAppBar(
            onPressedL: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HostJoinScreen()));},
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Game Lobby',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text('<players>',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Center(
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.all(Radius.circular(15.0),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * .40,
                          child: Center(
                            child: Text('Cancel',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HostJoinScreen()));
                        },
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * .10),
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.all(Radius.circular(15.0),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * .40,
                          child: Center(
                            child: Text('Start Game',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GameScreen(player: widget.player, type: widget.type, points: widget.points, character: widget.character)));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
