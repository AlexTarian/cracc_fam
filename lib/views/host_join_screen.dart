import 'package:cracc_fam/views/home_screen.dart';
import 'package:cracc_fam/views/lobby_screen.dart';
import 'package:flutter/material.dart';
import 'package:cracc_fam/components/custom_app_bar.dart';
import 'package:cracc_fam/components/icon_box_button.dart';
import 'package:cracc_fam/main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HostJoinScreen extends StatefulWidget {
  const HostJoinScreen({Key? key}) : super(key: key);

  @override
  State<HostJoinScreen> createState() => _HostJoinScreenState();
}

class _HostJoinScreenState extends State<HostJoinScreen> {
  TextEditingController pin = TextEditingController(text: '');
  int chars = 0;
  bool error = false;

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
                GestureDetector(
                  child: const IconBoxButton(
                    icon: Icons.center_focus_strong,
                    text: 'Host A Game',
                  ),
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
                      title: 'Host a Game',
                      desc: 'Enter a 4-digit pin',
                      content: SizedBox(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: pin,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLength: 4,
                              onChanged: (value) {
                                setState(() {
                                  chars = value.length;
                                });
                              },
                            ),
                            Visibility(
                              visible: error,
                              child: Text('Pin Must Contain 4 Digits.',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            )
                          ],
                        ),
                      ),
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
                          child: Text('Create',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          onPressed: () {
                            setState(() {
                              if (chars != 4) {
                                error = true;
                              }
                            });
                            if (chars == 4) {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LobbyScreen()));
                            }
                          },
                        ),
                      ],
                    ).show();
                  },
                ),
                const SizedBox(height: 30.0),
                GestureDetector(
                  child: const IconBoxButton(
                    icon: Icons.arrow_circle_right_outlined,
                    text: 'Join A Game',
                  ),
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
                      title: 'Join a Game',
                      desc: 'Enter a 4-digit pin',
                      content: SizedBox(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: pin,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLength: 4,
                              onChanged: (value) {
                                setState(() {
                                  chars = value.length;
                                });
                              },
                            ),
                            Visibility(
                              visible: error,
                                child: Text('Pin Must Contain 4 Digits.',
                                style: Theme.of(context).textTheme.bodySmall,
                                ),
                            )
                          ],
                        ),
                      ),
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
                          child: Text('Join',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          onPressed: () {
                            setState(() {
                              if (chars != 4) {
                                error = true;
                              }
                            });
                            if (chars == 4) {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LobbyScreen()));
                            }
                          },
                        ),
                      ],
                    ).show();
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
