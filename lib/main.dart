// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chain_reaction_app/pages/home_page.dart';
import 'package:chain_reaction_app/pages/settings_page.dart';
import 'package:chain_reaction_app/pages/select_page.dart';
import 'package:chain_reaction_app/pages/game_page.dart';

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
      debugShowCheckedModeBanner: false, home: const HomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF05111f),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // primarySwatch: Colors.red
      ),

      routes: {
        '/homepage': (context) => const HomePage(),
        '/settingspage': (context) => const SettingsPage(),
        '/selectpage': (context) => const SelectPage(),
        '/gamepage': (context) => const GamePage(),
      },

      // home: Scaffold(
      //   backgroundColor: Colors.blue[100],
      //   appBar: AppBar(
      //     title: Text("My Ap Bar"),
      //     backgroundColor: const Color.fromRGBO(255, 213, 79, 1),
      //     elevation: 2,
      //     leading: Icon(Icons.menu),
      //     actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      //   ),
      //   body: Center(
      //     child: GestureDetector(
      //       onTap: () {
      //         print("Tapped!!");
      //       },
      //       child: Container(
      //         height: 300,
      //         width: 300,
      //         // color: Colors.amber[200],
      //         decoration: BoxDecoration(
      //             color: Colors.amber[200],
      //             borderRadius: BorderRadius.circular(50)),
      //         padding: EdgeInsets.all(50),

      //         child: Text(
      //           "Ak bug",
      //           style: TextStyle(
      //               color: Colors.grey[800],
      //               fontSize: 28,
      //               fontWeight: FontWeight.bold),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
