import 'package:flutter/material.dart';

class OrbDesign extends StatefulWidget {
  final double size;
  final Color color;

  const OrbDesign({Key? key, required this.size, required this.color})
      : super(key: key);

  @override
  _OrbDesignState createState() => _OrbDesignState();
}

class _OrbDesignState extends State<OrbDesign>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Color startColor;
  late Color endColor;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {
          // Use the passed color and interpolate with a variant
          Color variantColor =
              widget.color.withOpacity(0.3); // Adjust as needed
          startColor =
              Color.lerp(widget.color, variantColor, _animation.value)!;
          endColor = Color.lerp(variantColor, widget.color, _animation.value)!;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    // Initialize with the passed color
    startColor = widget.color;
    endColor = widget.color.withOpacity(0.5); // Adjust as needed

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// import 'package:flutter/material.dart';

// class OrbDesign extends StatefulWidget {
//   final double size;
//   final Color color;

//   const OrbDesign({Key? key, required this.size, required this.color})
//       : super(key: key);

//   @override
//   _OrbDesignState createState() => _OrbDesignState();
// }

// class _OrbDesignState extends State<OrbDesign>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   late Animation<Color?> _colorAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 3),
//     )..repeat(reverse: true);

//     // Subtle pulsing effect
//     _scaleAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     ));

//     // Less bright color animation
//     _colorAnimation = ColorTween(
//       begin: widget.color.withOpacity(0.8), // Slightly opaque
//       end: widget.color.withOpacity(0.6), // More opaque
//     ).animate(_controller);
//   }s


// import 'package:flutter/material.dart';

// class OrbDesign extends StatefulWidget {
//   final double size;
//   final Color color; // Color for the core

//   const OrbDesign({Key? key, required this.size, required this.color}) : super(key: key);

//   @override
//   _OrbDesignState createState() => _OrbDesignState();
// }

// class _OrbDesignState extends State<OrbDesign> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Color?> _colorAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     )..repeat(reverse: true);

//     // Subtle color animation to give life to the orb's core
//     _colorAnimation = ColorTween(
//       begin: widget.color.withOpacity(0.8), // Less intense color
//       end: widget.color, // Full intensity for pulsating effect
//     ).animate(_controller);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _colorAnimation,
//       builder: (context, child) {
//         return Container(
//           width: widget.size,
//           height: widget.size,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             gradient: RadialGradient(
//               center: Alignment.center,
//               radius: 0.8,
//               colors: [
//                 _colorAnimation.value!, // Animated core color
//                 Colors.black, // Outer color for the glossy, predominant white effect
//               ],
//               stops: [0.3, 1.0], // Adjust the stop to control the spread of the core color
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: _colorAnimation.value!.withOpacity(0.5), // Soft glow effect from the core color
//                 blurRadius: 10,
//                 spreadRadius: 3,
//               ),
//             ],
//           ),
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
