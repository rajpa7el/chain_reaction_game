import 'package:chain_reaction_app/common/global.dart';
import 'package:flutter/material.dart';

class SelectionBox extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final IconData icon;
  final VoidCallback onTap;
  const SelectionBox({
    Key? key,
    required this.index,
    required this.selectedIndex,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenWidth = getScreenSize(context);
    double iconSize = screenWidth.width * 0.1;

    return InkWell(
      onTap: onTap,
      splashColor: globalSelectedBorderColor.withOpacity(0.5),
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.circular(globalSelectionBoxBorderRadius),
      child: Container(
        // width: 60,
        // height: 60,
        // margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: globalSelectionBoxBackgroundColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(globalSelectionBoxBorderRadius),
          border: Border.all(
            color: selectedIndex == index
                ? globalSelectedBorderColor
                : Colors.transparent,
            width: 3,
          ),
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: selectedIndex == index
              ? globalSelectedBorderColor
              : globalUnselectedIconColor,
        ),
      ),
    );
  }
}
