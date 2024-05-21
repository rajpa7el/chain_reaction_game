import 'package:chain_reaction_app/utils/orb/orb_design.dart';
import 'package:flutter/material.dart';

// class TwoOrbLayout extends StatelessWidget {
//   final double orbSize;
//   final double spacing;
//   final Color color;

//   const TwoOrbLayout(
//       {Key? key,
//       required this.orbSize,
//       this.spacing = 0.0,
//       required this.color})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         OrbDesign(size: orbSize * 0.85, color: color),
//         SizedBox(width: spacing), // Adjust the spacing as needed
//         OrbDesign(
//             size: orbSize * 0.85, color: color), // 50% size of the original
//       ],
//     );
//   }
// }



// class TwoOrbLayout extends StatefulWidget {
//   final double orbSize;
//   final double spacing;
//   final Color color;

//   const TwoOrbLayout({
//     Key? key,
//     required this.orbSize,
//     this.spacing = 5.0, // Providing a default spacing
//     required this.color,
//   }) : super(key: key);

//   @override
//   _TwoOrbLayoutState createState() => _TwoOrbLayoutState();
// }

// class _TwoOrbLayoutState extends State<TwoOrbLayout> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 10),
//       vsync: this,
//     )..repeat();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (_, child) {
//         return Transform.rotate(
//           angle: _controller.value * 2 * 3.14,
//           child: child,
//         );
//       },
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           OrbDesign(size: widget.orbSize, color: widget.color),
//           SizedBox(width: widget.spacing),
//           OrbDesign(size: widget.orbSize, color: widget.color),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:chain_reaction_app/utils/orb/orb_design.dart'; // Ensure this import is correctly pointing to your OrbDesign class

class TwoOrbLayout extends StatefulWidget {
  final double orbSize;
  final double spacing;
  final Color color;

  const TwoOrbLayout({
    Key? key,
    required this.orbSize,
    this.spacing = 0.0, // Default spacing
    required this.color,
  }) : super(key: key);

  @override
  _TwoOrbLayoutState createState() => _TwoOrbLayoutState();
}

class _TwoOrbLayoutState extends State<TwoOrbLayout> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * 3.14, // Rotates the whole row
          child: child,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OrbDesign(size: widget.orbSize * 0.85, color: widget.color),
          SizedBox(width: widget.spacing), // Adjust the spacing as needed
          OrbDesign(size: widget.orbSize * 0.85, color: widget.color),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when the widget is removed
    super.dispose();
  }
}


