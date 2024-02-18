// import 'dart:math';
// import 'package:chain_reaction_app/common/global.dart';
// import 'package:flutter/material.dart';

// class SplitOrbPainter extends CustomPainter {
//   final double progress;
//   final Color color;
//   final CellPosition position;

//   SplitOrbPainter({required this.progress, required this.color, required this.position});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..color = color;
//     final center = Offset(size.width / 2, size.height / 2);
//     double radius = size.width * 0.1; // Adjust based on your size

//     // Determine number of splits based on position
//     int splits;
//     switch (position) {
//       case CellPosition.corner:
//         splits = 2;
//         break;
//       case CellPosition.edge:
//         splits = 3;
//         break;
//       case CellPosition.center:
//         splits = 4;
//         break;
//     }

//     // Draw splits
//     for (int i = 0; i < splits; i++) {
//       double angle = (2 * pi / splits) * i + (pi * progress);
//       double dx = center.dx + (progress * size.width * 0.5) * cos(angle);
//       double dy = center.dy + (progress * size.height * 0.5) * sin(angle);
//       canvas.drawCircle(Offset(dx, dy), radius, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
