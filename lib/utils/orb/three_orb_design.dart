import 'package:chain_reaction_app/utils/orb/orb_design.dart';
import 'package:flutter/material.dart';

class MultiOrbLayout extends StatelessWidget {
  final double orbSize;
  final double spacing;
  final Color color;

  const MultiOrbLayout(
      {Key? key,
      required this.orbSize,
      this.spacing = 0.0,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Two orbs touching each other
        Row(
          // crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OrbDesign(size: orbSize * 0.85, color: color),
          ],
        ),

        // Three orbs in a triangle touching each other
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OrbDesign(size: orbSize * 0.85, color: color),
            SizedBox(width: spacing), // Adjust the spacing as needed
            OrbDesign(
                size: orbSize * 0.85, color: color), // 75% size of the original
          ],
        ),
      ],
    );
  }
}
