import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const PrimaryButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjusting padding and font size with a minimum value
    double paddingHorizontal = screenWidth * 0.2;
    double fontSize = screenWidth * 0.04;
    paddingHorizontal =
        paddingHorizontal.clamp(16.0, 30.0); // Minimum and maximum padding
    fontSize = fontSize.clamp(14.0, 18.0); // Minimum and maximum font size

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xC60A0E6E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: 15.0),
        child: FittedBox(
          fit: BoxFit
              .scaleDown, // Ensures the text scales down if it doesn't fit
          child: Text(
            buttonText,
            style: TextStyle(
              color: Color(0xFFFFFCF6),
              fontSize: fontSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
