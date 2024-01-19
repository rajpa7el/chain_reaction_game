import 'package:flutter/material.dart';

class CustomBackIcon extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomBackIcon({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        size: 28,
        color: Colors.white,
      ),
      onPressed: onPressed,
    );
  }
}
