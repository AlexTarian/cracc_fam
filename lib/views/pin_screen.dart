import 'package:cracc_fam/views/lobby_screen.dart';
import 'package:flutter/material.dart';
import 'package:cracc_fam/components/custom_app_bar.dart';
import 'package:cracc_fam/components/icon_box_button.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({Key? key, required this.type}) : super(key: key);

  final String type;

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  TextEditingController pin = TextEditingController(text: '');
  bool confirmEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85.0),
        child: Builder(builder: (context) {
          return customAppBar(
            onPressedL: () {
              Navigator.pop(context);
              },
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
                Text('${widget.type} a Game',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 50.0),
                TextFormField(
                  controller: pin,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 4,
                  onChanged: (value) {
                    setState(() {
                      if(value.length==4) {
                        confirmEnabled=true;
                      } else {
                        confirmEnabled=false;
                      }
                    });
                  },
                ),
                const SizedBox(height: 50.0),
                Center(
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(15.0),
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
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * .10),
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            color: confirmEnabled ? Theme.of(context).primaryColor : Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(15.0),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * .40,
                          child: Center(
                            child: Text('Confirm',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        onTap: () {
                          if (confirmEnabled) {
                            Navigator.pop(context);
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LobbyScreen()));
                          }
                        },
                      ),
                    ],
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
