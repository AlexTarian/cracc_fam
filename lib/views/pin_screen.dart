import 'package:cracc_fam/components/custom_text_field.dart';
import 'package:cracc_fam/views/player_select_screen.dart';
import 'package:flutter/material.dart';
import 'package:cracc_fam/components/custom_app_bar.dart';
import 'package:flutter/services.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({Key? key, required this.type, required this.player}) : super(key: key);

  final String type;
  final String player;

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  TextEditingController pin = TextEditingController(text:'');
  TextEditingController points = TextEditingController(text:'');
  bool confirmEnabled = false;

  @override
  initState() {
    pin.text = widget.type=='Host' ? '2855' : '';
    confirmEnabled = pin.text.length==4 ? true : false;
    super.initState();
  }

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
                CustomTextField(
                  controller: pin,
                    label: '4-Digit Pin',
                  maxLength: 4,
                  keyboard: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      if(value!.length==4 && (points.text=='' || int.parse(points.text) > 0)) {
                        confirmEnabled=true;
                      } else {
                        confirmEnabled=false;
                      }
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                Visibility(
                  visible: widget.type=='Host',
                  child: CustomTextField(
                    controller: points,
                    label: 'Points to Win',
                    maxLength: 2,
                    keyboard: TextInputType.number,
                    format: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {
                      setState(() {
                        if(pin.text.length==4 && (value=='' || int.parse(value!) > 0)) {
                          confirmEnabled=true;
                        } else {
                          confirmEnabled=false;
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(height: 50.0),
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
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * .10),
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            color: confirmEnabled ? Theme.of(context).primaryColor : Colors.grey,
                            borderRadius: const BorderRadius.all(Radius.circular(15.0),
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
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PlayerSelectScreen(player: widget.player, type: widget.type, points: int.parse(points.text))));
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
