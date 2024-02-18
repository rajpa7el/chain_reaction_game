import 'package:chain_reaction_app/common/global.dart';
// import 'package:chain_reaction_app/utils/multi_orb_design.dart'; // Import the MultiOrbLayout widget
import 'package:chain_reaction_app/utils/orb/orb_design.dart';
import 'package:chain_reaction_app/utils/orb/three_orb_design.dart';
import 'package:chain_reaction_app/utils/orb/two_orb_design.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<int> orbCount = List.generate(3, (index) => 0); // Initialize counts to 0

  @override
  Widget build(BuildContext context) {
    Size screenSize = getScreenSize(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: screenSize.width * 0.5,
          height: screenSize.height * 0.85, // Adjusted height
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (context, index) {
              double cellSize = MediaQuery.of(context).size.width *
                  0.4; // 50% of screen width
              double orbSize = cellSize * 0.5; // 50% of cell size
              return GestureDetector(
                onTap: () {
                  setState(() {
                    orbCount[index] =
                        (orbCount[index] + 1) % 4; // Cycle through 0, 1, 2, 3
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(cellSize * 0.25),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: playerColors[0]),
                  ),
                  child: orbCount[index] == 1
                      ? OrbDesign(
                          size: orbSize,
                          color: Colors.red,
                        )
                      : orbCount[index] == 2
                          ? TwoOrbLayout(
                              orbSize: orbSize,
                              color: Colors.red,
                            )
                          : orbCount[index] == 3
                              ? MultiOrbLayout(
                                  orbSize: orbSize,
                                  spacing: 1.0,
                                  color: Colors.red)
                              : Container(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
