import 'package:cracc_fam/constants.dart';
import 'package:cracc_fam/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cracc_fam/components/custom_app_bar.dart';
//import 'package:cracc_fam/components/icon_box_button.dart';
//import 'package:cracc_fam/views/player_select_screen.dart';
//import 'package:cracc_fam/views/settings_screen.dart';
import 'package:cracc_fam/components/player_list.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PlayerSelectScreen extends StatefulWidget {
  const PlayerSelectScreen({Key? key}) : super(key: key);

  @override
  State<PlayerSelectScreen> createState() => _PlayerSelectScreenState();
}

class _PlayerSelectScreenState extends State<PlayerSelectScreen> {
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
                  'Choose Your Character',
                  style: Theme.of(context).textTheme.titleLarge,
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
                        ),
                        child: ListTile(
                          minVerticalPadding: 10.0,
                          leading: PlayerList().playerList.elementAt(index).icon,
                          title: Text(PlayerList().playerList.elementAt(index).name, style: const TextStyle(fontSize: 20.0),),
                          iconColor: Theme.of(context).primaryColor,
                          textColor: Theme.of(context).primaryColor,
                          onTap: () {
                            Alert(
                              context: context,
                              title: PlayerList().playerList.elementAt(index).name,
                              desc: PlayerList().playerList.elementAt(index).text,
                              buttons: [
                                DialogButton(
                                  color: italyRed,
                                  child: const Text('Cancel',
                                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                DialogButton(
                                  color: italyRed,
                                  child: const Text('Choose',
                                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                                  ),
                                  onPressed: () {
                                    setState(() {

                                    });
                                    Navigator.pop(context);
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
