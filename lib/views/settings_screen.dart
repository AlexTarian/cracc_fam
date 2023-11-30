import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:cracc_fam/views/home_screen.dart';
import 'package:cracc_fam/main.dart';
import 'package:cracc_fam/components/custom_app_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    // loadInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85.0),
        child: Builder(
            builder: (context) {
              return customAppBar(
                onPressedL: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));},
                iconR: Icons.help,
                onPressedR: () {},
              );
            }
        ),
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
                TextButton(
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        children: <Widget>[
                          Icon(MyApp.themeNotifier.value == ThemeMode.light
                              ? Icons.light_mode
                              : Icons.dark_mode,
                              color: Theme.of(context).primaryColor,
                            size: 30,
                          ),
                          const SizedBox(width: 25.0),
                          Text(
                            MyApp.themeNotifier.value == ThemeMode.light
                                ? 'Switch to Light Mode'
                                : 'Switch to Dark Mode',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        MyApp.themeNotifier.value =
                        MyApp.themeNotifier.value == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light;
                      });
                      setState(() async{
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        MyApp.themeNotifier.value == ThemeMode.light ? await prefs.setBool('my_light',true) : await prefs.setBool('my_light',false);
                      });
                    },
                    onLongPress: () {
                      if (MyApp.themeNotifier.value == ThemeMode.light) {
                        setState(() {
                          MyApp.aestheticMode =
                          MyApp.aestheticMode
                              ? MyApp.aestheticMode = false
                              : MyApp.aestheticMode = true;
                        });
                        Alert(
                          context: context,
                          style: const AlertStyle(
                            isCloseButton: false,
                            titleStyle: TextStyle(
                              color: Color(0xFFce65ba),
                            ),
                          ),
                          title: MyApp.aestheticMode
                              ? 'Pizza Time: Engaged'
                              : 'Pizza Time: Disengaged',
                          buttons: [
                            DialogButton(
                              color: const Color(0xFFce65ba),
                              child: Text(MyApp.aestheticMode ? 'Pizza Time!' : 'Got it.',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ).show();
                      }
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}