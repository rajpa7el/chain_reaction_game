// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter/animation.dart';


// import 'package:flutter/material.dart';

// class ExplosionAnimation extends StatefulWidget {
//   final double size;
//   final Color color;
//   final Function onAnimationComplete;

//   const ExplosionAnimation({
//     Key? key,
//     required this.size,
//     required this.color,
//     required this.onAnimationComplete,
//   }) : super(key: key);

//   @override
//   _ExplosionAnimationState createState() => _ExplosionAnimationState();
// }

// class _ExplosionAnimationState extends State<ExplosionAnimation>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );

//     _animation = Tween<double>(begin: 0.0, end: widget.size).animate(_controller)
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           widget.onAnimationComplete();
//         }
//       });

//     _controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: _animation.value,
//       height: _animation.value,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: widget.color.withOpacity(1 - _controller.value),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }


// import 'dart:math';
// import 'package:flutter/material.dart';

// class ExplosionAnimation extends StatefulWidget {
//   final double size;
//   final Color color;
//   final VoidCallback onAnimationComplete;

//   const ExplosionAnimation({
//     Key? key,
//     required this.size,
//     required this.color,
//     required this.onAnimationComplete,
//   }) : super(key: key);

//   @override
//   _ExplosionAnimationState createState() => _ExplosionAnimationState();
// }

// class _ExplosionAnimationState extends State<ExplosionAnimation>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     )..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           widget.onAnimationComplete();
//         }
//       });

//     _controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Only render the CustomPaint if the animation is ongoing; avoid rendering post-completion to prevent a reappearing dot.
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, child) {
//         // Check if animation is complete; if so, don't render anything.
//         if (_controller.isCompleted) {
//           return SizedBox();
//         }
//         return CustomPaint(
//           size: Size(widget.size, widget.size),
//           painter: ExplosionPainter(_controller.value, widget.color),
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

// // Custom painter to draw the explosion effect
// class ExplosionPainter extends CustomPainter {
//   double animationValue;
//   Color color;

//   ExplosionPainter(this.animationValue, this.color);

//   @override
//   void paint(Canvas canvas, Size size) {
//     if (animationValue < 1.0) {
//       // Calculate properties based on animation value
//       final paint = Paint()..color = color.withOpacity(1 - animationValue);
//       final center = Offset(size.width / 2, size.height / 2);
//       final maxRadius = size.width * 0.5 * animationValue;

//       // Draw the expanding circle
//       canvas.drawCircle(center, maxRadius, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
