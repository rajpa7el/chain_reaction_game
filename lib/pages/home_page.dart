import 'dart:async';
import 'dart:math';

import 'package:chain_reaction_app/utils/primary_button.dart';
import 'package:chain_reaction_app/utils/settings_icon.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSmall = false;
  late Timer _timer;
  double position = 0.0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: _getRandomDuration()), (timer) {
      setState(() {
        position = position == 1.0 ? -1.0 : 1.0;
      });
    });
  }

  int _getRandomDuration() {
    return Random().nextInt(2000) + 500;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // UI
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double dynamicAppBarHeight =
        screenHeight * 0.1; // Example: 10% of screen height

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        toolbarHeight: dynamicAppBarHeight,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 10.0),
            child: CustomSettingsIcon(
              onPressed: () {
                Navigator.pushNamed(context, '/settingspage');
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              // alignment: Alignment.topCenter,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: _getRandomDuration()),
                  alignment: Alignment(0, position),
                  child: SizedBox(
                    // margin: EdgeInsets.all(bgAnimationValue),
                    // alignment: Alignment(0, 0),
                    height: dynamicAppBarHeight,
                    width: double.infinity,
                    // color: Colors.blue,
                    child: Image.asset('lib/images/bg_animated.png',
                        fit: BoxFit.fitWidth),
                  ),
                ),
                // Positioned(
                //   // top: 50,
                //   left: 0,
                //   right: 0,
                //   child: Align(
                //     alignment: Alignment.center,
                //     child: GestureDetector(
                GestureDetector(
                  onLongPress: () {
                    setState(() {
                      isSmall = true; // Set to small when long press starts
                      // bgAnimationValue = isSmall ? 100.0 : 0.0;
                    });
                  },
                  onLongPressEnd: (details) {
                    setState(() {
                      isSmall = false; // Set back to big when long press ends
                    });
                  },
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: isSmall ? 100 : 300,
                      // color: Colors.blue,
                      width: isSmall ? 100 : 300,
                      child: Image.asset(
                        'lib/images/logo3.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // ),
                ),
                // ),
                // ),
                // // Positioned PrimaryButton
                Positioned(
                  bottom: 150,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: PrimaryButton(
                      buttonText: 'Play',
                      onPressed: () {
                        Navigator.pushNamed(context, '/selectpage');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 100.0),
          //   child: PrimaryButton(
          //     buttonText: 'Play',
          //     onPressed: () {
          //       Navigator.pushNamed(context, '/selectpage');
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
