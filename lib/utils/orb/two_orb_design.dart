import 'package:chain_reaction_app/utils/orb/orb_design.dart';
import 'package:flutter/material.dart';

class TwoOrbLayout extends StatelessWidget {
  final double orbSize;
  final double spacing;
  final Color color;

  const TwoOrbLayout(
      {Key? key,
      required this.orbSize,
      this.spacing = 0.0,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OrbDesign(size: orbSize * 0.85, color: color),
        SizedBox(width: spacing), // Adjust the spacing as needed
        OrbDesign(
            size: orbSize * 0.85, color: color), // 50% size of the original
      ],
    );
  }
}
