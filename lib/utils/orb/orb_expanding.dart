import 'package:chain_reaction_app/utils/orb/orb_design.dart';
import 'package:flutter/material.dart';

class ExpandingOrb extends StatefulWidget {
  final double baseSize;

  const ExpandingOrb({Key? key, required this.baseSize}) : super(key: key);

  @override
  _ExpandingOrbState createState() => _ExpandingOrbState();
}

class _ExpandingOrbState extends State<ExpandingOrb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration:
          const Duration(milliseconds: 100), // Shorter duration for fast effect
      vsync: this,
    )..repeat(reverse: true);

    // Small range for a short distance effect
    _animation = Tween(begin: 0.0, end: 0.05).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        double size = widget.baseSize + (_animation.value * widget.baseSize);
        return OrbDesign(size: size);
      },
    );
  }
}
