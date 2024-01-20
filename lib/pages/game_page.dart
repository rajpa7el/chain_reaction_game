import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  final int noOfPlayers;
  const GamePage({super.key, required this.noOfPlayers});

  static const List<Color> playerColors = [
    Color.fromARGB(255, 255, 0, 0), // PlayerId 1 - Red
    Color.fromARGB(255, 0, 255, 0), // PlayerId 2 - Green
    Color.fromARGB(255, 0, 0, 255), // PlayerId 3 - Blue
    Color.fromARGB(255, 255, 192, 203), // PlayerId 4 - Pink
    Color.fromARGB(255, 255, 165, 0), // PlayerId 5 - Orange
    Color.fromARGB(255, 128, 0, 128), // PlayerId 6 - Purple
    Color.fromARGB(255, 255, 255, 0), // PlayerId 7 - Yellow
    Color.fromARGB(255, 0, 255, 255), // PlayerId 8 - Cyan
    Color.fromARGB(255, 0, 128, 128), // PlayerId 9 - Teal
    Color.fromARGB(255, 48, 25, 52), // PlayerId 10 - Maroon
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;

    const int numColumns = 6;
    const int numRows = 12;

    // Cell size based on screen width for perfect squares
    double cellSize = screenWidth / numColumns;

    // Total grid height
    double totalGridHeight = cellSize * numRows;

    print('Screen Width: $screenWidth');
    print('Screen Height: ${screenSize.height}');
    print('Cell Size: $cellSize');
    print('Total Grid Height: $totalGridHeight');

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        // Center the grid vertically
        child: Container(
          width: screenWidth, // Grid width
          height: totalGridHeight + 40, // Grid height
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: numColumns * numRows,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: numColumns,
              childAspectRatio: 1.0, // Perfect square cells
            ),
            itemBuilder: (context, index) {
              int playerId = index % playerColors.length;

              return GestureDetector(
                onTap: () {
                  // Logic for tapping on a grid cell
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: playerColors[noOfPlayers - 1]),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
