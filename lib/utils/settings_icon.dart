import 'package:flutter/material.dart';

class CustomSettingsIcon extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomSettingsIcon({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate dynamic icon size based on screen size
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth * 0.10; // Example: 10% of screen width

    return IconButton(
      icon: Icon(
        Icons.settings,
        size: iconSize,
        color: Color(0xC60A0E6E),
      ),
      onPressed: onPressed,
    );
  }
}
