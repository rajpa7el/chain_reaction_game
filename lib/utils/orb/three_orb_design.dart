import 'package:chain_reaction_app/utils/orb/orb_design.dart';
import 'package:flutter/material.dart';

// class MultiOrbLayout extends StatelessWidget {
//   final double orbSize;
//   final double spacing;
//   final Color color;

//   const MultiOrbLayout(
//       {Key? key,
//       required this.orbSize,
//       this.spacing = 0.0,
//       required this.color})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         // Two orbs touching each other
//         Row(
//           // crossAxisAlignment: CrossAxisAlignment.baseline,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             OrbDesign(size: orbSize * 0.85, color: color),
//           ],
//         ),

//         // Three orbs in a triangle touching each other
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             OrbDesign(size: orbSize * 0.85, color: color),
//             SizedBox(width: spacing), // Adjust the spacing as needed
//             OrbDesign(
//                 size: orbSize * 0.85, color: color), // 75% size of the original
//           ],
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:chain_reaction_app/utils/orb/orb_design.dart'; // Ensure this import is correctly pointing to your OrbDesign class

class MultiOrbLayout extends StatefulWidget {
  final double orbSize;
  final double spacing;
  final Color color;

  const MultiOrbLayout({
    Key? key,
    required this.orbSize,
    this.spacing = 0.0,
    required this.color,
  }) : super(key: key);

  @override
  _MultiOrbLayoutState createState() => _MultiOrbLayoutState();
}

class _MultiOrbLayoutState extends State<MultiOrbLayout> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * 3.14, // Rotates the whole layout
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Top orb row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OrbDesign(size: widget.orbSize * 0.85, color: widget.color),
                ],
              ),
              // Bottom orb row forming a triangle
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OrbDesign(size: widget.orbSize * 0.85, color: widget.color),
                  SizedBox(width: widget.spacing), // Adjust the spacing as needed
                  OrbDesign(size: widget.orbSize * 0.85, color: widget.color),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
