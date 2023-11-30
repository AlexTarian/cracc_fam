import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cracc_fam/views/splash_screen.dart';
import 'package:cracc_fam/constants.dart';

late SharedPreferences prefs;
bool isLightMode = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  getSharedPrefs(prefs);
  runApp(MyApp());
}

void getSharedPrefs(SharedPreferences prefs) async{
  isLightMode = prefs.getBool('my_light') ?? true;
}

class MyApp extends StatefulWidget {
  static final ValueNotifier<ThemeMode> themeNotifier = isLightMode ? ValueNotifier(ThemeMode.light) : ValueNotifier(ThemeMode.dark);

  const MyApp({Key? key}) : super(key: key);
  static bool aestheticMode = false;

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: MyApp.themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Splash Screen',
            theme: darkTheme,
            darkTheme: lightTheme,
            themeMode: currentMode,
            home: SplashScreen(),
          );
        });
  }
}
