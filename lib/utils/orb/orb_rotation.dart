import 'dart:math';
import 'package:chain_reaction_app/common/global.dart';
import 'package:chain_reaction_app/utils/orb/orb_design.dart';
import 'package:flutter/material.dart';

class RotatingOrb extends StatefulWidget {
  final double size;
  final Duration duration;
  final RotationAxis rotationAxis;

  const RotatingOrb({
    Key? key,
    required this.size,
    this.duration = const Duration(seconds: 5),
    this.rotationAxis = RotationAxis.z,
  }) : super(key: key);

  @override
  _RotatingOrbState createState() => _RotatingOrbState();
}

class _RotatingOrbState extends State<RotatingOrb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: OrbDesign(size: widget.size,color: Colors.red),
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..rotateX(widget.rotationAxis == RotationAxis.x
                ? _controller.value * 2 * pi
                : 0)
            ..rotateY(widget.rotationAxis == RotationAxis.y
                ? _controller.value * 2 * pi
                : 0)
            ..rotateZ(widget.rotationAxis == RotationAxis.z
                ? _controller.value * 2 * pi
                : 0),
          child: child,
        );
      },
    );
  }
}
