import 'package:chain_reaction_app/utils/orb/orb_design.dart';
import 'package:flutter/material.dart';

class TwoOrbLayout extends StatelessWidget {
  final double orbSize;
  final double spacing;

  const TwoOrbLayout({Key? key, required this.orbSize, this.spacing = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OrbDesign(size: orbSize * 0.65),
        SizedBox(width: spacing), // Adjust the spacing as needed
        OrbDesign(size: orbSize * 0.65), // 50% size of the original
      ],
    );
  }
}
