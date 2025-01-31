import 'package:flutter/material.dart';
import 'package:chain_reaction_app/common/global.dart';

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
    Size screenSize = getScreenSize(context);
    double paddingHorizontal = screenSize.width * 0.2;
    double fontSize = screenSize.width * 0.04;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryButtonBackgroundColor.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: 15.0),
        child: FittedBox(
          fit: BoxFit
              .scaleDown,
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontFamily: globalFontFamily,
              fontWeight: globalFontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
