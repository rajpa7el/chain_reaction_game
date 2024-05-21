import 'package:chain_reaction_app/utils/orb/animation/explosion_animation.dart';
import 'package:chain_reaction_app/utils/orb/orb_design.dart';
import 'package:chain_reaction_app/utils/orb/three_orb_design.dart';
import 'package:chain_reaction_app/utils/orb/two_orb_design.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:chain_reaction_app/common/global.dart';
import 'package:chain_reaction_app/logic/gamelogic.dart';

class GamePage extends StatefulWidget {
  final GameLogic gameLogic;

  const GamePage({Key? key, required this.gameLogic}) : super(key: key);

  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  // List<int> orbCount = List.generate(3, (index) => 0);
  @override
  void initState() {
    super.initState();
    widget.gameLogic.setOnExplodeCallback(() {
      setState(() {});
    });
  }

// //for animation
//   bool shouldAnimateSplitForCell(int index) {
//     // Example logic: If the cell has reached critical mass, animate the split
//     int? orbCount = widget.gameLogic.cellStates[index];
//     int criticalMass = widget.gameLogic.getCriticalMass(
//         index ~/ widget.gameLogic.numColumns,
//         index % widget.gameLogic.numColumns);
//     return orbCount != null && orbCount >= criticalMass;
//   }

  final int numColumns = 6;

  List<Offset> calculateTargetOffsets(int index) {
    // Example implementation: Calculate target offsets based on cell index
    double cellSize =
        MediaQuery.of(context).size.width / numColumns; // Calculate cell size
    int row = index ~/ numColumns;
    int col = index % numColumns;
    double centerX = (col + 0.5) * cellSize;
    double centerY = (row + 0.5) * cellSize;

    return [
      Offset(centerX - cellSize / 4, centerY - cellSize / 4), // Top left
      Offset(centerX + cellSize / 4, centerY - cellSize / 4), // Top right
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = getScreenSize(context);
    double screenWidth = screenSize.width;

    const int numColumns = 6;
    const int numRows = 12;

    double cellSize = screenWidth / numColumns;
    double orbSize = cellSize * 0.40;
    double totalGridHeight = cellSize * numRows;
    int _currentPlayerId = widget.gameLogic.currentPlayerId;

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: SizedBox(
          width: screenWidth,
          height: totalGridHeight + 40,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: numColumns * numRows,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: numColumns,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (context, index) {
              int? orbCount = widget.gameLogic.cellStates[index];

              int? cellPlayerId = widget.gameLogic.cellColors[index];
              Color orbColor = cellPlayerId != null
                  ? playerColors[cellPlayerId]
                  : Colors.brown;

              bool isExploding =
                  widget.gameLogic.cellExplosionAnimations[index] ?? false;

              if (isExploding) {
                // return ExplosionAnimation(
                //   size: cellSize, // Use the cell size for the animation size
                //   color:
                //       orbColor, // Use the orb color or a specific explosion color
                //   onAnimationComplete: () {
                //     // Reset the explosion state for this cell and rebuild the UI
                //     widget.gameLogic.resetExplosionAnimation(index);
                //     setState(() {}); // Trigger a rebuild to update the UI
                //   },
                // );
              } else {
                // Render the cell normally
              }

              // if (shouldAnimateSplitForCell(index)) {
              //   // Calculate targetOffsets based on cell position and game logic
              //   List<Offset> targetOffsets = calculateTargetOffsets(index);
              //   return SplitOrbAnimation(
              //     size: orbSize,
              //     color: orbColor,
              //     targetOffsets: targetOffsets,
              //   );
              // } else {
              return GestureDetector(
                onTap: () async {
                  int row = index ~/ widget.gameLogic.numColumns;
                  int col = index % widget.gameLogic.numColumns;
                  if (kDebugMode) {
                    print('Row: $row, Column: $col, Index: $index');
                  }
                  // Await the async operation outside of setState
                  await widget.gameLogic.onTapCell(index);
                  // Then call setState to update the UI
                  setState(() {});
                },
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: playerColors[_currentPlayerId]),
                    ),
                    // child: Text(
                    //   widget.gameLogic.cellStates[index]?.toString() ?? '',
                    //   style: TextStyle(
                    //       color: textColor, fontSize: 45), // Style as needed
                    // ),
                    child: orbCount == 1
                        ? OrbDesign(size: orbSize, color: orbColor)
                        : orbCount == 2
                            ? TwoOrbLayout(orbSize: orbSize, color: orbColor)
                            : orbCount == 3
                                ? MultiOrbLayout(
                                    orbSize: orbSize,
                                    spacing: 1.0,
                                    color: orbColor,
                                  )
                                : orbCount != null && orbCount >= 4
                                    ? Text(
                                        "Error Orb: $orbCount",
                                        style: TextStyle(color: orbColor),
                                      )
                                    : Container()),
              );
              // }
            },
          ),
        ),
      ),
    );
  }
}
