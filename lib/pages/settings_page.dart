import 'package:chain_reaction_app/common/global.dart';
import 'package:chain_reaction_app/utils/back_icon.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    // double dynamicAppBarHeight =
    //     screenHeight * 0.1; // Example: 10% of screen height

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 3,
        toolbarHeight: calculateAppBarHeight(context),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 10.0),
          child: CustomBackIcon(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Text(
              'Settings',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: calculateIconSize(context),
                  fontWeight: globalFontWeight),
            ),
          ),
        ),
      ),
    );
  }
}
