// import 'package:chain_reaction_app/utils/orb/orb_design.dart';
// import 'package:flutter/material.dart';

// class ExpandingOrb extends StatefulWidget {
//   final double baseSize;

//   const ExpandingOrb({Key? key, required this.baseSize}) : super(key: key);

//   @override
//   _ExpandingOrbState createState() => _ExpandingOrbState();
// }

// class _ExpandingOrbState extends State<ExpandingOrb>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration:
//           const Duration(milliseconds: 100), // Shorter duration for fast effect
//       vsync: this,
//     )..repeat(reverse: true);

//     // Small range for a short distance effect
//     _animation = Tween(begin: 0.0, end: 0.05).animate(_controller);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _animation,
//       builder: (context, child) {
//         double size = widget.baseSize + (_animation.value * widget.baseSize);
//         return OrbDesign(size: size,color: Colors.red);
//       },
//     );
//   }
// }


import 'package:chain_reaction_app/utils/orb/orb_design.dart';
import 'package:flutter/material.dart';

class ExpandingOrb extends StatefulWidget {
  final double baseSize;
  final Color startColor;
  final Color endColor;

  const ExpandingOrb({
    Key? key,
    required this.baseSize,
    this.startColor = Colors.blue, // Default starting color
    this.endColor = Colors.red, // Default ending color
  }) : super(key: key);

  @override
  _ExpandingOrbState createState() => _ExpandingOrbState();
}

class _ExpandingOrbState extends State<ExpandingOrb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500), // Smooth, pulsating effect
      vsync: this,
    )..repeat(reverse: true);

    // Enhancing size animation for a subtle pulsating effect
    _sizeAnimation = Tween(begin: 0.0, end: 0.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Adding color transition effect
    _colorAnimation = ColorTween(
      begin: widget.startColor,
      end: widget.endColor,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_sizeAnimation, _colorAnimation]),
      builder: (context, child) {
        double size = widget.baseSize + (_sizeAnimation.value * widget.baseSize);
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [_colorAnimation.value!, _colorAnimation.value!.withOpacity(0)],
            ),
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
