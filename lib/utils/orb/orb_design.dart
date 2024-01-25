import 'package:flutter/material.dart';

class OrbDesign extends StatefulWidget {
  final double size;

  const OrbDesign({Key? key, required this.size}) : super(key: key);

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
          // Interpolate colors based on the animation value
          startColor = Color.lerp(Colors.red, Colors.black, _animation.value)!;
          endColor = Color.lerp(Colors.black, Colors.red, _animation.value)!;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // Reverse the animation when it completes
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          // Forward the animation when it dismisses
          _controller.forward();
        }
      });

    startColor = Colors.red;
    endColor = Colors.black;

    // Start the animation
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
