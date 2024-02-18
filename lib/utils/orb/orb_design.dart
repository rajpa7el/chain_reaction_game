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
