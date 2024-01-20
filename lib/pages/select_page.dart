import 'package:chain_reaction_app/common/global.dart';
import 'package:chain_reaction_app/utils/selection_box.dart';
import 'package:flutter/material.dart';
import 'package:chain_reaction_app/utils/back_icon.dart';
import 'package:chain_reaction_app/utils/primary_button.dart';
import 'package:chain_reaction_app/utils/settings_icon.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  SelectPageState createState() => SelectPageState();
}

class SelectPageState extends State<SelectPage> {
  //variables
  int _noOfPlayers = 2;
  // int novm =
  int _selectedBoxIndex = 0; // -1 means no selection

  @override
  Widget build(BuildContext context) {
    Size screenSize = getScreenSize(context);
    double numFontSize = screenSize.height * 0.04;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: calculateAppBarHeight(context),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 10.0),
          child: CustomBackIcon(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
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
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: icons.length,
              itemBuilder: (context, index) => _buildSelectionBox(index),
            ),
          ),
          Center(
            child: Container(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '$_noOfPlayers',
                  style:
                      TextStyle(color: Colors.blueGrey, fontSize: numFontSize),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: PrimaryButton(
              buttonText: 'Start',
              onPressed: () {
                Navigator.pushNamed(context, '/gamepage');
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionBox(int index) {
    return SelectionBox(
      index: index,
      selectedIndex: _selectedBoxIndex,
      icon: icons[index],
      onTap: () {
        setState(() {
          _selectedBoxIndex = index;
          _noOfPlayers = index + 2;
        });
      },
    );
  }
}
