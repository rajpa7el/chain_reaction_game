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
  @override
  Widget build(BuildContext context) {
    Size screenSize = getScreenSize(context);
    double screenWidth = screenSize.width;

    const int numColumns = 6;
    const int numRows = 12;

    double cellSize = screenWidth / numColumns;
    double totalGridHeight = cellSize * numRows;

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
              return GestureDetector(
                onTap: () {
                  setState(() {
                    //
                    if (kDebugMode) {
                      print(index);
                    }
                    //
                    widget.gameLogic.onTapCell(index);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                        color: playerColors[widget.gameLogic.currentPlayerId]),
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
