import 'dart:math';
import 'package:chain_reaction_app/common/global.dart';
import 'package:chain_reaction_app/utils/orb/orb_design.dart';
import 'package:flutter/material.dart';

// class RotatingOrb extends StatefulWidget {
//   final double size;
//   final Duration duration;
//   final RotationAxis rotationAxis;

//   const RotatingOrb({
//     Key? key,
//     required this.size,
//     this.duration = const Duration(seconds: 5),
//     this.rotationAxis = RotationAxis.z,
//   }) : super(key: key);

//   @override
//   _RotatingOrbState createState() => _RotatingOrbState();
// }

// class _RotatingOrbState extends State<RotatingOrb>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: widget.duration,
//       vsync: this,
//     )..repeat();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       child: OrbDesign(size: widget.size,color: Colors.red),
//       builder: (context, child) {
//         return Transform(
//           alignment: Alignment.center,
//           transform: Matrix4.identity()
//             ..rotateX(widget.rotationAxis == RotationAxis.x
//                 ? _controller.value * 2 * pi
//                 : 0)
//             ..rotateY(widget.rotationAxis == RotationAxis.y
//                 ? _controller.value * 2 * pi
//                 : 0)
//             ..rotateZ(widget.rotationAxis == RotationAxis.z
//                 ? _controller.value * 2 * pi
//                 : 0),
//           child: child,
//         );
//       },
//     );
//   }
// }

enum RotationAxis { x, y, z }

class RotatingOrb extends StatefulWidget {
  final double size;
  final Duration duration;
  final RotationAxis rotationAxis;
  final List<Color> colors; // Add colors for cycling

  const RotatingOrb({
    Key? key,
    required this.size,
    this.duration = const Duration(seconds: 5),
    this.rotationAxis = RotationAxis.z,
    this.colors = const [Colors.blue, Colors.red], // Default color range
  }) : super(key: key);

  @override
  _RotatingOrbState createState() => _RotatingOrbState();
}

class _RotatingOrbState extends State<RotatingOrb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();

    _rotation = Tween<double>(begin: 0, end: 2 * pi).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );

    // Color cycling animation
    _colorAnimation = ColorTween(
      begin: widget.colors.first,
      end: widget.colors.last,
    ).animate(_controller);
  }

  Matrix4 _rotationMatrix() {
    switch (widget.rotationAxis) {
      case RotationAxis.x:
        return Matrix4.rotationX(_rotation.value);
      case RotationAxis.y:
        return Matrix4.rotationY(_rotation.value);
      case RotationAxis.z:
        return Matrix4.rotationZ(_rotation.value);
      default:
        return Matrix4.identity();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_controller, _rotation, _colorAnimation]),
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: _rotationMatrix(),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: _colorAnimation.value!.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: child,
          ),
        );
      },
      child: OrbDesign(
        size: widget.size,
        color: _colorAnimation.value ?? widget.colors.first, // Use animated color
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
