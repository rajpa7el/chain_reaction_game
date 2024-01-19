import 'package:chain_reaction_app/utils/selection_box.dart';
import 'package:flutter/material.dart';
import 'package:chain_reaction_app/utils/back_icon.dart';
import 'package:chain_reaction_app/utils/primary_button.dart';
import 'package:chain_reaction_app/utils/settings_icon.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
//variables
  int _noOfPlayers = 0;
  int _selectedBoxIndex = 0; // -1 means no selection

//icons for the selection
  final List<IconData> icons = [
    Icons.filter_2,
    Icons.filter_3,
    Icons.filter_4,
    Icons.filter_5_outlined,
    Icons.filter_6_sharp,
    Icons.filter_7,
    Icons.filter_8,
    Icons.filter_9,
    Icons.group,
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double dynamicAppBarHeight =
        screenHeight * 0.1; // Example: 10% of screen height

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: dynamicAppBarHeight,
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
          // Selection boxes
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20), // Adjust padding as needed
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of boxes in a row
                crossAxisSpacing: 20, // Spacing between boxes horizontally
                mainAxisSpacing: 20, // Spacing between boxes vertically
              ),
              itemCount: icons.length, // Number of items in the grid
              itemBuilder: (context, index) => _buildSelectionBox(index),
            ),
          ),
          Center(
            child: Container(
              // color: Colors.white.withOpacity(0.1),
              child: Text(
                '${_noOfPlayers + 2} ',
                style: const TextStyle(color: Colors.white, fontSize: 24.0),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(50.0), // Add padding as needed
              child: PrimaryButton(
                buttonText: 'Start',
                onPressed: () {
                  Navigator.pushNamed(context, '/gamepage');
                },
              ),
            ),
          ),
        ],
      ),
    );
    // ],
    // ),
    // );
  }

  Widget _buildSelectionBox(int index) {
    return SelectionBox(
      index: index,
      selectedIndex: _selectedBoxIndex,
      icon: icons[index],
      onTap: () {
        setState(() {
          _selectedBoxIndex = index;
          _noOfPlayers = index;
        });
      },
    );
  }
}
