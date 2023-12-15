import 'package:cracc_fam/views/home_screen.dart';
import 'package:cracc_fam/views/lobby_screen.dart';
import 'package:flutter/material.dart';
import 'package:cracc_fam/components/custom_app_bar.dart';
import 'package:cracc_fam/main.dart';
import 'package:cracc_fam/components/player_list.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PlayerSelectScreen extends StatefulWidget {
  const PlayerSelectScreen({Key? key, required this.type, required this.player, required this.points}) : super(key: key);

  final String type;
  final String player;
  final int points;

  @override
  State<PlayerSelectScreen> createState() => _PlayerSelectScreenState();
}

class _PlayerSelectScreenState extends State<PlayerSelectScreen> {

  String character = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85.0),
        child: Builder(builder: (context) {
          return customAppBar(
              onPressedL: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));},
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
                Text(
                    'Welcome ${widget.player}!\nChoose Your Character!',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50.0),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemCount: PlayerList().playerList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.transparent,
                                Colors.transparent,
                                PlayerList().playerList.elementAt(index).color,
                              ],
                            )
                        ),
                        child: ListTile(
                          minVerticalPadding: 10.0,
                          leading: PlayerList().playerList.elementAt(index).icon,
                          title: Text(PlayerList().playerList.elementAt(index).name, style: Theme.of(context).textTheme.titleMedium),
                          iconColor: Theme.of(context).primaryColor,
                          textColor: Theme.of(context).primaryColor,
                          onTap: () {
                            Alert(
                              style: AlertStyle(
                                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                titleStyle: TextStyle(color: Theme.of(context).primaryColor),
                                descStyle: TextStyle(
                                  color: MyApp.themeNotifier.value == ThemeMode.light
                                    ? Colors.white
                                    : Colors.black,
                                ),
                              ),
                              context: context,
                              title: PlayerList().playerList.elementAt(index).name,
                              desc: PlayerList().playerList.elementAt(index).text,
                              image: PlayerList().playerList.elementAt(index).image,
                              buttons: [
                                DialogButton(
                                  color: Theme.of(context).primaryColor,
                                  child: Text('Cancel',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                DialogButton(
                                  color: Theme.of(context).primaryColor,
                                  child: Text('Choose',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      character=PlayerList().playerList.elementAt(index).name;
                                    });
                                    Navigator.pop(context);
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LobbyScreen(player: widget.player, type: widget.type, points: widget.points, character: character)));
                                  },
                                ),
                              ],
                            ).show();
                          },
                        ),
                      );
                    },
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
