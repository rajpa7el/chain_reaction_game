import 'package:chain_reaction_app/utils/orb/orb_design.dart';
import 'package:flutter/material.dart';

class SplitOrbAnimation extends StatefulWidget {
  final double size;
  final Color color;
  final List<Offset> targetOffsets; // Targets for each fragment

  const SplitOrbAnimation({
    Key? key,
    required this.size,
    required this.color,
    required this.targetOffsets,
  }) : super(key: key);

  @override
  _SplitOrbAnimationState createState() => _SplitOrbAnimationState();
}

class _SplitOrbAnimationState extends State<SplitOrbAnimation>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers = [];
  late List<Animation<Offset>> _animations = [];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    for (var targetOffset in widget.targetOffsets) {
      final controller = AnimationController(
        duration: const Duration(milliseconds: 10),
        vsync: this,
      );

      final animation = Tween<Offset>(
        begin: Offset.zero,
        end: targetOffset,
      ).animate(controller);

      _controllers.add(controller);
      _animations.add(animation);
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(_animations.length, (index) {
        return AnimatedBuilder(
          animation: _animations[index],
          builder: (context, child) {
            return Transform.translate(
              offset: _animations[index].value,
              child: OrbDesign(size: widget.size, color: widget.color),
            );
          },
        );
      }),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
