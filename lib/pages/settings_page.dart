import 'package:chain_reaction_app/common/global.dart';
import 'package:chain_reaction_app/utils/back_icon.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
                  fontSize: calculateIconSize(context) * 0.8,
                  fontWeight: globalFontWeight),
            ),
          ),
        ),
      ),
    );
  }
}
