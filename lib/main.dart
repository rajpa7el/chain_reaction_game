import 'package:chain_reaction_app/common/global.dart';
import 'package:chain_reaction_app/pages/test/test_page.dart';
import 'package:chain_reaction_app/pages/test/test_page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chain_reaction_app/pages/home_page.dart';
import 'package:chain_reaction_app/pages/settings_page.dart';
import 'package:chain_reaction_app/pages/select_page.dart';
// import 'package:chain_reaction_app/pages/game_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: globalBackgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // primarySwatch: Colors.red
      ),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/settingspage': (context) => const SettingsPage(),
        '/selectpage': (context) => const SelectPage(),
        // '/gamepage': (context) => const GamePage(),
        '/testpage': (context) => const TestPage(),
        '/testpage2': (context) => const TestPage2(),
      },
    );
  }
}
