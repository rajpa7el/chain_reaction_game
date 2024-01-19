import 'package:flutter/material.dart';

class SelectionBox extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final IconData icon;
  final VoidCallback onTap;
  // final double iconSize;
  const SelectionBox({
    Key? key,
    required this.index,
    required this.selectedIndex,
    required this.icon,
    required this.onTap,
    // this.iconSize = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate the icon size based on the screen size
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth * 0.1;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color:
                selectedIndex == index ? Colors.blueGrey : Colors.transparent,
            width: 3,
          ),
        ),
        child: Icon(
          icon,
          size: iconSize, // Use the iconSize parameter
          color: selectedIndex == index ? Colors.blueGrey : Colors.grey,
        ),
      ),
    );
  }
}
