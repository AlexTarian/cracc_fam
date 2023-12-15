import 'package:cracc_fam/components/custom_text_field.dart';
import 'package:cracc_fam/views/home_screen.dart';
import 'package:cracc_fam/views/pin_screen.dart';
import 'package:flutter/material.dart';
import 'package:cracc_fam/components/custom_app_bar.dart';
import 'package:cracc_fam/components/icon_box_button.dart';

class HostJoinScreen extends StatefulWidget {
  const HostJoinScreen({Key? key}) : super(key: key);

  @override
  State<HostJoinScreen> createState() => _HostJoinScreenState();
}

class _HostJoinScreenState extends State<HostJoinScreen> {
  TextEditingController playerName = TextEditingController();
  bool ready = false;

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
                Text('New Game',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30.0),
                CustomTextField(
                  controller: playerName,
                  label: 'What is Your Name?',
                  maxLength: 10,
                  onChanged: (value) {
                    setState(() {
                      if(value!.isNotEmpty) {
                        ready=true;
                      } else {
                        ready=false;
                      }
                    });
                  },
                ),
                const SizedBox(height: 30.0),
                Visibility(
                  visible: ready,
                  child: GestureDetector(
                    child: const IconBoxButton(
                      icon: Icons.center_focus_strong,
                      text: 'Host A Game',
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PinScreen(type: 'Host', player: playerName.text,)));
                    },
                  ),
                ),
                const SizedBox(height: 30.0),
                Visibility(
                  visible: ready,
                  child: GestureDetector(
                    child: const IconBoxButton(
                      icon: Icons.arrow_circle_right_outlined,
                      text: 'Join A Game',
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PinScreen(type: 'Join', player: playerName.text,)));
                    },
                  ),
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
