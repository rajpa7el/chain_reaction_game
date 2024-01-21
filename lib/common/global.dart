library globals;

import "package:flutter/material.dart";

// Global image asset paths
const String globalDesignImage = 'lib/images/bg_design.png';
const String globalLogoImage = 'lib/images/logo3.png';

Size getScreenSize(BuildContext context) {
  MediaQueryData queryData = MediaQuery.of(context);
  return Size(queryData.size.width, queryData.size.height);
}

//main.dart
const Color globalBackgroundColor = Color(0xFF05111f);

// AppBar height
double calculateAppBarHeight(BuildContext context) {
  double screenHeight = getScreenSize(context).height;
  return screenHeight * 0.10;
}

// Homepage
const int logoSmallDuration = 500;
double calculateDesignHeight(BuildContext context) {
  double screenHeight = getScreenSize(context).height;
  return screenHeight * 0.15;
}
double calculateLogoSize(BuildContext context) {
  Size screenSize = getScreenSize(context);
  double averageSize = (screenSize.height + screenSize.width) / 2;
  return averageSize * 0.45;
}

//SelectPage
final List<IconData> icons = [
  Icons.filter_2,
  Icons.filter_3,
  Icons.filter_4,
  Icons.filter_5_outlined,
  Icons.filter_6_sharp,
  Icons.filter_7,
  Icons.filter_8,
  Icons.filter_9,
  Icons.groups_2,
];
double calculateSelectBoxGridSize(BuildContext context) {
  Size screenSize = getScreenSize(context);
  double averageSize = (screenSize.height + screenSize.width) / 2;
  return averageSize * 0.65;
}

//GamePage
final List<Color> playerColors = [
  const Color.fromARGB(255, 255, 0, 0), // PlayerId 1 - Red
  const Color.fromARGB(255, 0, 255, 0), // PlayerId 2 - Green
  const Color.fromARGB(255, 0, 0, 255), // PlayerId 3 - Blue
  const Color.fromARGB(255, 255, 192, 203), // PlayerId 4 -Light Pink
  const Color.fromARGB(255, 255, 165, 0), // PlayerId 5 - Orange
  const Color.fromARGB(255, 128, 0, 128), // PlayerId 6 - Dark Pink
  const Color.fromARGB(255, 255, 255, 0), // PlayerId 7 - Yellow
  const Color.fromARGB(255, 0, 255, 255), // PlayerId 8 - Cyan
  const Color.fromARGB(255, 0, 128, 128), // PlayerId 9 - Teal
  const Color.fromARGB(255, 48, 25, 52), // PlayerId 10 - Dark Purple
];


// Back icon
const double backIconSize = 28;
const Color backIconColor = Colors.white;

double calculateIconSize(BuildContext context) {
  Size screenSize = getScreenSize(context);
  double averageSize = (screenSize.height + screenSize.width) / 2;
  return averageSize * 0.05;
}

// Settings icon
const Color globalSettingsIconColor = Color(0xFF0D47A1);

// Primary button
const Color primaryButtonBackgroundColor = Color(0xFF0D47A1);
const String globalFontFamily = 'Poppins';
const FontWeight globalFontWeight = FontWeight.w700;

// Selection box
const Color globalSelectionBoxBackgroundColor = Colors.black;
const Color globalSelectedBorderColor = Colors.blueGrey;
const Color globalUnselectedIconColor = Colors.grey;
const double globalSelectionBoxBorderRadius = 10.0;
