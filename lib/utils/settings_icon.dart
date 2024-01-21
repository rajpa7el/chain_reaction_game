import 'package:chain_reaction_app/common/global.dart';
import 'package:flutter/material.dart';

class CustomSettingsIcon extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomSettingsIcon({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.settings,
        size: calculateIconSize(context) * 1.5,
        color: Colors.blue[900],
      ),
      onPressed: onPressed,
    );
  }
}
